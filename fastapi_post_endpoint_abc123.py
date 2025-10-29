from fastapi import FastAPI
import uvicorn
import random
import string

# Create a random filename for this file
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
app = FastAPI(title=f"FastAPI Endpoint - {random_name}")

@app.post("/data")
async def create_item(item: dict):
    """
    POST endpoint that accepts JSON data and returns a confirmation
    """
    # Process the received data (in a real app, you might save to database, etc.)
    return {
        "message": "Data received successfully",
        "received_data": item,
        "status": "success"
    }

@app.get("/")
async def root():
    return {"message": f"Welcome to the FastAPI endpoint - {random_name}"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)