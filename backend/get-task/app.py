# backend/get-task/app.py
from flask import Flask, jsonify, request
from flask_cors import CORS
from sqlalchemy import create_engine, Column, Integer, String, Text, DateTime
from sqlalchemy.orm import declarative_base, sessionmaker
from sqlalchemy.sql import func
import os
import urllib.parse  # ✅ NEW: for safe encoding of ODBC connection string

app = Flask(__name__)
CORS(app)

# ✅ NEW: Azure SQL engine (no secrets hardcoded, all from env)
def get_engine():
    # Ye 4 env vars Kubernetes / container runtime se aayenge
    server = os.environ["DB_SERVER"]      # e.g. aifuturesqlserver1411.database.windows.net
    db_name = os.environ["DB_NAME"]       # e.g. aifuturesqldb1411
    user = os.environ["DB_USER"]          # e.g. admin123
    password = os.environ["DB_PASSWORD"]  # e.g. xxxx

    conn_str = (
        f"Driver={{ODBC Driver 18 for SQL Server}};"
        f"Server=tcp:{server},1433;"
        f"Database={db_name};"
        f"Uid={user};"
        f"Pwd={password};"
        "Encrypt=yes;"
        "TrustServerCertificate=no;"
        "Connection Timeout=30;"
    )

    params = urllib.parse.quote_plus(conn_str)
    return create_engine(f"mssql+pyodbc:///?odbc_connect={params}")

# ❌ OLD (SQLite) — remove/comment this block:
# DB_PATH = os.environ.get("TASKS_DB", "/data/tasks.db")
# os.makedirs(os.path.dirname(DB_PATH), exist_ok=True)
# engine = create_engine(f"sqlite:///{DB_PATH}", connect_args={"check_same_thread": False})

# ✅ NEW: use Azure SQL engine
engine = get_engine()

Base = declarative_base()
SessionLocal = sessionmaker(bind=engine)

class Task(Base):
    __tablename__ = "tasks"
    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(256), nullable=False)
    description = Column(Text, nullable=True)
    created_at = Column(DateTime(timezone=True), server_default=func.now())

# Table Azure SQL DB me banegi agar missing hai
Base.metadata.create_all(engine)

@app.route("/health", methods=["GET"])
def health():
    return jsonify({"status": "healthy", "service": os.environ.get('SERVICE_NAME', 'tasks')}), 200

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
        return jsonify({"success": True, "task": {"id": t.id, "title": t.title}}), 201
    finally:
        db.close()

if __name__ == "__main__":
    # SQLite ke liye /data banane ki ab zarurat nahi
    app.run(host="0.0.0.0", port=int(os.environ.get("PORT", 5000)), debug=False)
