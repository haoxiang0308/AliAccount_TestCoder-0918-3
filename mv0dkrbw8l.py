from fastapi import FastAPI
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
