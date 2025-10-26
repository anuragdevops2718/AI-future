from flask import Flask, jsonify, request
from flask_cors import CORS
import os
from supabase import create_client, Client

app = Flask(__name__)
CORS(app)

supabase_url = os.environ.get("SUPABASE_URL")
supabase_key = os.environ.get("SUPABASE_ANON_KEY")
supabase: Client = create_client(supabase_url, supabase_key)

@app.route('/health', methods=['GET'])
def health():
    return jsonify({"status": "healthy", "service": "add-task"}), 200

@app.route('/tasks', methods=['POST'])
def add_task():
    try:
        auth_header = request.headers.get('Authorization')
        if not auth_header:
            return jsonify({"error": "Authorization header required"}), 401

        token = auth_header.replace('Bearer ', '')

        user = supabase.auth.get_user(token)
        user_id = user.user.id

        data = request.get_json()
        if not data or 'title' not in data:
            return jsonify({"error": "Task title is required"}), 400

        title = data.get('title')
        completed = data.get('completed', False)

        task_data = {
            "title": title,
            "completed": completed,
            "user_id": user_id
        }

        response = supabase.table('tasks').insert(task_data).execute()

        return jsonify({
            "success": True,
            "task": response.data[0],
            "message": "Task added successfully"
        }), 201

    except Exception as e:
        return jsonify({
            "success": False,
            "error": str(e)
        }), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)
