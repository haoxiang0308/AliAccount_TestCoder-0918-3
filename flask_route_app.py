from flask import Flask, jsonify
import random
import string

app = Flask(__name__)

@app.route('/api/data', methods=['GET'])
def get_data():
    """A route that returns a JSON object with a random string."""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return jsonify({
        'message': 'Hello from the Flask route!',
        'random_id': random_string,
        'data': {
            'item1': 'value1',
            'item2': 'value2',
            'status': 'success'
        }
    })

if __name__ == '__main__':
    app.run(debug=True)