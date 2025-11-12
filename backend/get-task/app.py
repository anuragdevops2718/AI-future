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
    return jsonify({"status": "healthy", "service": "get-task"}), 200

@app.route('/tasks', methods=['GET'])
def get_tasks():
    try:
        auth_header = request.headers.get('Authorization')
        if not auth_header:
            return jsonify({"error": "Authorization header required"}), 401

        token = auth_header.replace('Bearer ', '')

        supabase.auth.get_user(token)

        response = supabase.table('tasks').select('*').order('created_at', desc=True).execute()

        return jsonify({
            "success": True,
            "tasks": response.data,
            "count": len(response.data)
        }), 200

    except Exception as e:
        return jsonify({
            "success": False,
            "error": str(e)
        }), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
