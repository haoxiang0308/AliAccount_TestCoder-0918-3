from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/api/data', methods=['GET'])
def get_data():
    data = {
        "message": "Hello, World!",
        "status": "success",
        "data": {
            "item1": "value1",
            "item2": "value2"
        }
    }
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)