from fastapi import FastAPI

app = FastAPI()

@app.post("/data/")
async def receive_data(item: dict):
    # Process the received data here
    return {"received": item}