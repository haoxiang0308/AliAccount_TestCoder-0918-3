from flask import Flask, jsonify
import random
import string

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    """A route that returns JSON data"""
    sample_data = {
        'id': random.randint(1, 100),
        'name': 'Sample Item',
        'description': 'This is a sample item returned as JSON',
        'status': 'active'
    }
    return jsonify(sample_data)

@app.route('/', methods=['GET'])
def home():
    """Home route"""
    return jsonify({'message': 'Welcome to the Flask app!'})

if __name__ == '__main__':
    app.run(debug=True)