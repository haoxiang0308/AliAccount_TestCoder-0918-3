import random
import string
import os

def generate_random_filename():
    """Generate a random Python filename"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def create_flask_app_with_random_name():
    """Create a Flask app file with a random name"""
    flask_code = '''from flask import Flask, jsonify
import random
import string

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def get_data():
    """Route that returns JSON data"""
    sample_data = {
        'id': random.randint(1, 1000),
        'name': 'Sample Data',
        'description': 'This is a sample JSON response from Flask',
        'status': 'success'
    }
    return jsonify(sample_data)

@app.route('/', methods=['GET'])
def home():
    """Home route"""
    return jsonify({'message': 'Welcome to the Flask app!'})

if __name__ == '__main__':
    app.run(debug=True)
'''

    random_filename = generate_random_filename()
    filepath = os.path.join('/workspace', random_filename)
    
    with open(filepath, 'w') as f:
        f.write(flask_code)
    
    print(f"Flask app saved to: {filepath}")
    return filepath

if __name__ == '__main__':
    create_flask_app_with_random_name()