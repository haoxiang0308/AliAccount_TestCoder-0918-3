from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/api/data', methods=['GET'])
def get_data():
    """Define a route that returns JSON data."""
    data = {
        "message": "Hello from the API!",
        "status": "success",
        "data": {
            "item_id": 12345,
            "name": "Sample Item",
            "value": 100
        }
    }
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)