from fastapi import FastAPI
import uvicorn
import random
import string

app = FastAPI()

@app.post("/data")
async def create_item(data: dict):
    """
    Accepts a POST request with JSON data and returns a confirmation.
    """
    # Process the received data here
    item_id = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    
    return {
        "message": "Data received successfully",
        "item_id": item_id,
        "received_data": data
    }

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)