from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    """Route that returns JSON data"""
    sample_data = {
        'message': 'Hello, this is JSON data from Flask!',
        'status': 'success',
        'data': {
            'id': 1,
            'name': 'Sample Item',
            'value': 42,
            'items': ['item1', 'item2', 'item3']
        }
    }
    return jsonify(sample_data)

@app.route('/', methods=['GET'])
def home():
    """Home route"""
    return jsonify({'message': 'Welcome to the Flask app!'})

if __name__ == '__main__':
    app.run(debug=True)