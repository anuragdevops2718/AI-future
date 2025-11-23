# backend/add-task/app.py
from flask import Flask, jsonify, request
from flask_cors import CORS
from sqlalchemy import create_engine, Column, Integer, String, Text, DateTime
from sqlalchemy.orm import declarative_base, sessionmaker
from sqlalchemy.sql import func
import os

app = Flask(__name__)
CORS(app)

# 🔹 DB connection string from env (K8s secret)
DB_CONN_STRING = os.environ.get("DB_CONN_STRING")

if not DB_CONN_STRING:
    # Agar env var nahi milega toh pod crash karega -> turant pata chal jayega
    raise RuntimeError("DB_CONN_STRING env var not set")

# 🔹 SQLAlchemy engine (mssql+pyodbc with ODBC Driver 18 in conn string)
engine = create_engine(
    DB_CONN_STRING,
    pool_pre_ping=True,
    echo=False,
)

Base = declarative_base()
SessionLocal = sessionmaker(bind=engine)


class Task(Base):
    __tablename__ = "tasks"
    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(256), nullable=False)
    description = Column(Text, nullable=True)
    created_at = Column(DateTime(timezone=True), server_default=func.now())


# DB me table nahi hai toh create ho jayega
Base.metadata.create_all(engine)


@app.route("/health", methods=["GET"])
def health():
    return jsonify({
        "status": "healthy",
        "service": os.environ.get("SERVICE_NAME", "tasks-add")
    }), 200


# OPTIONAL: agar sirf POST wala microservice chahiye toh isko comment bhi kar sakta hai
@app.route("/tasks", methods=["GET"])
def get_tasks():
    db = SessionLocal()
    try:
        tasks = db.query(Task).order_by(Task.created_at.desc()).all()
        result = [
            {
                "id": t.id,
                "title": t.title,
                "description": t.description,
                "created_at": t.created_at.isoformat() if t.created_at else None,
            }
            for t in tasks
        ]
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
            "task": {
                "id": t.id,
                "title": t.title,
                "description": t.description,
            },
        }), 201
    finally:
        db.close()


if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=int(os.environ.get("PORT", 5001)),  # alag port rakh sakta hai agar chaahe
        debug=False,
    )
