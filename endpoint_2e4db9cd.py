from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.post("/data")
async def receive_post(request_data: dict):
    # Process the received data here
    print(f"Received POST data: {request_data}")
    return {"message": "Data received successfully", "received_data": request_data}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)