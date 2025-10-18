from flask import Flask, jsonify
import random
import string

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    """Route that returns JSON data"""
    sample_data = {
        'id': random.randint(1, 1000),
        'name': 'Sample Item',
        'description': 'This is a sample JSON response from Flask',
        'status': 'active',
        'tags': ['flask', 'json', 'api', 'sample']
    }
    return jsonify(sample_data)

@app.route('/', methods=['GET'])
def home():
    """Home route"""
    return jsonify({'message': 'Flask app with JSON route is running!'})

if __name__ == '__main__':
    # Generate a random port number between 8000 and 9999
    random_port = random.randint(8000, 9999)
    print(f"Starting Flask app on port {random_port}")
    app.run(debug=True, host='0.0.0.0', port=random_port)