from flask import Flask, jsonify
import random
import string

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    """Route that returns JSON data"""
    sample_data = {
        'id': random.randint(1, 1000),
        'name': 'Sample Data',
        'description': 'This is sample JSON data returned from a Flask route',
        'status': 'success',
        'items': [
            {'item_id': 1, 'name': 'Item 1'},
            {'item_id': 2, 'name': 'Item 2'},
            {'item_id': 3, 'name': 'Item 3'}
        ]
    }
    return jsonify(sample_data)

@app.route('/', methods=['GET'])
def home():
    """Home route"""
    return jsonify({'message': 'Welcome to the Flask app!'})

if __name__ == '__main__':
    app.run(debug=True)