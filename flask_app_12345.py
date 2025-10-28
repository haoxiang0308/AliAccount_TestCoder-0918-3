from flask import Flask, jsonify
import json
import random
import string

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    """A route that returns JSON data"""
    sample_data = {
        'id': random.randint(1, 1000),
        'name': 'Sample Data',
        'description': 'This is a sample JSON response from Flask',
        'items': [
            {'name': 'item1', 'value': 10},
            {'name': 'item2', 'value': 20},
            {'name': 'item3', 'value': 30}
        ]
    }
    return jsonify(sample_data)

@app.route('/', methods=['GET'])
def home():
    """Home route"""
    return jsonify({'message': 'Welcome to the Flask app!'})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)