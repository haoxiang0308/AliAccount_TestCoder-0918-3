from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.post("/data")
async def receive_data(data: dict):
    # Process the received data here
    print(f"Received data: {data}")
    return {"message": "Data received successfully", "received_data": data}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)