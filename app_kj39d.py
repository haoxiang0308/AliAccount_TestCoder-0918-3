from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/api/data', methods=['GET'])
def get_data():
    # Sample JSON data
    sample_data = {
        "message": "Hello, this is your JSON data!",
        "status": "success",
        "data": {
            "id": 12345,
            "name": "Sample Item",
            "value": 42
        }
    }
    return jsonify(sample_data)

if __name__ == '__main__':
    app.run(debug=True)