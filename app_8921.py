from flask import Flask

app = Flask(__name__)

@app.route('/data')
def get_data():
    return {"message": "Hello, JSON data!", "status": "success"}

if __name__ == '__main__':
    app.run(debug=True)