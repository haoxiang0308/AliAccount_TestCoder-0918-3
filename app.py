from flask import Flask, jsonify
import uuid

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    # Generate a random ID for the response
    random_id = str(uuid.uuid4())
    data = {
        "id": random_id,
        "message": "Hello, this is your JSON data!",
        "status": "success"
    }
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)