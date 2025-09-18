import secrets
import string

# Generate a random filename
alphabet = string.ascii_letters + string.digits
random_string = ''.join(secrets.choice(alphabet) for _ in range(10))
filename = f"{random_string}.py"

# Create the Flask route code
flask_code = '''from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/api/data', methods=['GET'])
def get_data():
    # Sample JSON data
    data = {
        "message": "Hello, World!",
        "status": "success",
        "data": {
            "id": 123,
            "name": "Sample Data",
            "items": ["item1", "item2", "item3"]
        }
    }
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)
'''

# Write the code to the randomly named file
with open(filename, 'w') as f:
    f.write(flask_code)

print(f"Flask route saved to {filename}")