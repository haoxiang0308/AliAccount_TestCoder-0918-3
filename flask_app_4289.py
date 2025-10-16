from flask import Flask, jsonify
import json

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    """Route that returns JSON data"""
    data = {
        "message": "Hello, this is JSON data from Flask!",
        "status": "success",
        "data": {
            "id": 123,
            "name": "Sample Data",
            "items": ["item1", "item2", "item3"],
            "metadata": {
                "created_at": "2023-01-01",
                "version": "1.0"
            }
        }
    }
    return jsonify(data)

@app.route('/', methods=['GET'])
def home():
    """Home route"""
    return jsonify({"message": "Welcome to the Flask app!"})

if __name__ == '__main__':
    app.run(debug=True)