from flask import Flask, jsonify
import json

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    """Route that returns JSON data"""
    data = {
        'message': 'Hello from Flask!',
        'status': 'success',
        'data': {
            'users': [
                {'id': 1, 'name': 'Alice', 'email': 'alice@example.com'},
                {'id': 2, 'name': 'Bob', 'email': 'bob@example.com'},
                {'id': 3, 'name': 'Charlie', 'email': 'charlie@example.com'}
            ],
            'total_count': 3
        }
    }
    return jsonify(data)

@app.route('/', methods=['GET'])
def home():
    """Home route"""
    return jsonify({'message': 'Welcome to the Flask app!'})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)