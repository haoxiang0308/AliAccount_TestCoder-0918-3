from fastapi import FastAPI
import uvicorn
from typing import Dict, Any

app = FastAPI()

@app.post("/data")
async def create_item(data: Dict[Any, Any]):
    """
    POST endpoint that accepts JSON data and returns a confirmation message
    """
    # Process the received data here
    return {
        "message": "Data received successfully",
        "received_data": data
    }

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)