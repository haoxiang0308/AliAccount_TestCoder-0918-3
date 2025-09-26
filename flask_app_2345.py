from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    sample_data = {
        "message": "Hello, this is your JSON data!",
        "status": "success",
        "data": {
            "item1": "value1",
            "item2": "value2",
            "item3": 42
        }
    }
    return jsonify(sample_data)

if __name__ == '__main__':
    app.run(debug=True)