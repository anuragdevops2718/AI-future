# backend/get-task/app.py
from flask import Flask, jsonify, request
from flask_cors import CORS
from sqlalchemy import create_engine, Column, Integer, String, Text, DateTime
from sqlalchemy.orm import declarative_base, sessionmaker
from sqlalchemy.sql import func
import os

app = Flask(__name__)
CORS(app)

Base = declarative_base()

# ---------------- DB ENGINE CONFIG ----------------
# Priority:
# 1) If DB_CONN_STRING env set -> use Azure SQL (or any DB)
# 2) Else fallback => local SQLite file /data/tasks.db

DB_CONN_STRING = os.environ.get("DB_CONN_STRING")

if DB_CONN_STRING:
    # Example for Azure SQL (set from outside, NOT here):
    # DB_CONN_STRING = "mssql+pytds://admin123:P@ssw0rd!@aifuturesqlserver1411.database.windows.net:1433/aifuturesqldb1411?encrypt=yes"
    engine = create_engine(DB_CONN_STRING)
else:
    # SQLite fallback
    DB_PATH = os.environ.get("TASKS_DB", "/data/tasks.db")
    os.makedirs(os.path.dirname(DB_PATH), exist_ok=True)
    engine = create_engine(
        f"sqlite:///{DB_PATH}",
        connect_args={"check_same_thread": False}
    )

SessionLocal = sessionmaker(bind=engine)

# ---------------- MODEL ----------------
class Task(Base):
    __tablename__ = "tasks"
    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(256), nullable=False)
    description = Column(Text, nullable=True)
    created_at = Column(DateTime(timezone=True), server_default=func.now())

# create table if missing
Base.metadata.create_all(engine)

# ---------------- ROUTES ----------------
@app.route("/health", methods=["GET"])
def health():
    return jsonify({
        "status": "healthy",
        "service": os.environ.get("SERVICE_NAME", "tasks"),
        "db": "azure-sql" if DB_CONN_STRING else "sqlite"
    }), 200


@app.route("/tasks", methods=["GET"])
def get_tasks():
    db = SessionLocal()
    try:
        tasks = db.query(Task).order_by(Task.created_at.desc()).all()
        result = [{
            "id": t.id,
            "title": t.title,
            "description": t.description,
            "created_at": t.created_at.isoformat() if t.created_at else None
        } for t in tasks]
        return jsonify({"success": True, "tasks": result, "count": len(result)}), 200
    finally:
        db.close()


@app.route("/tasks", methods=["POST"])
def add_task():
    payload = request.get_json() or {}
    title = payload.get("title")
    description = payload.get("description")

    if not title:
        return jsonify({"success": False, "error": "title required"}), 400

    db = SessionLocal()
    try:
        t = Task(title=title, description=description)
        db.add(t)
        db.commit()
        db.refresh(t)
        return jsonify({
            "success": True,
            "task": {"id": t.id, "title": t.title}
        }), 201
    finally:
        db.close()


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.environ.get("PORT", 5000)), debug=False)
