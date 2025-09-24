from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.post("/data")
async def receive_data(item: dict):
    # Process the received data (example: just return it)
    return {"received": item}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
