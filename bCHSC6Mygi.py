from fastapi import FastAPI

app = FastAPI()

@app.post("/receive-data")
async def handle_data(data: dict):
    return {"message": "Data received successfully", "received_data": data}
