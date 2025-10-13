from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.post("/data/")
async def receive_data(item: dict):
    """
    Accepts a POST request with JSON data.
    """
    # Process the received data here
    print(f"Received data: {item}")
    return {"message": "Data received successfully", "received_data": item}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)