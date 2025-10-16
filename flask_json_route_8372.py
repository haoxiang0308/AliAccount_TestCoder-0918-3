from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/api/data', methods=['GET'])
def get_json_data():
    """Route that returns JSON data"""
    sample_data = {
        "message": "Hello, this is JSON data from Flask!",
        "status": "success",
        "data": {
            "id": 1,
            "name": "Sample Item",
            "description": "This is a sample JSON response",
            "tags": ["flask", "json", "api", "route"],
            "active": True
        }
    }
    return jsonify(sample_data)

@app.route('/', methods=['GET'])
def home():
    """Home route"""
    return jsonify({"message": "Flask app with JSON route is running!"})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)