from fastapi import FastAPI
import secrets
import string

# Create a random filename
def generate_random_filename():
    # Generate a random string of 10 characters
    random_string = ''.join(secrets.choice(string.ascii_letters + string.digits) for _ in range(10))
    return f"{random_string}.py"

# Initialize FastAPI app
app = FastAPI()

# Define a POST endpoint
@app.post("/data")
async def receive_post_data(data: dict):
    """
    Accepts a POST request with JSON data and saves a FastAPI endpoint to a randomly named .py file
    """
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Content for the randomly named file
    file_content = '''from fastapi import FastAPI

app = FastAPI()

@app.post("/receive-data")
async def handle_data(data: dict):
    return {"message": "Data received successfully", "received_data": data}
'''
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(file_content)
    
    return {"message": f"POST endpoint saved to {random_filename}", "received_data": data}