from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.post("/data/")
async def receive_data(item: dict):
    # Process the received data here
    return {"received_item": item, "status": "success"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)