import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def create_fastapi_endpoint_file():
    """Create a FastAPI endpoint file with a random name"""
    random_filename = generate_random_filename()
    filepath = os.path.join("/workspace", random_filename)
    
    fastapi_code = '''from fastapi import FastAPI
import uvicorn
import random
import string

app = FastAPI()

@app.post("/data")
async def receive_post_data(item: dict):
    """
    Accepts a POST request with JSON data and returns a confirmation.
    """
    # Process the received data (for this example, we'll just return it back)
    response_data = {
        "received_data": item,
        "status": "received successfully",
        "processing_id": ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    }
    return response_data

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
'''
    
    with open(filepath, 'w') as f:
        f.write(fastapi_code)
    
    print(f"Created FastAPI endpoint file: {filepath}")
    return filepath

if __name__ == "__main__":
    create_fastapi_endpoint_file()