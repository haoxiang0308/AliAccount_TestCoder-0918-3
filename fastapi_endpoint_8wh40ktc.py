from fastapi import FastAPI
import uvicorn

app = FastAPI(title="FastAPI POST Endpoint")

@app.post("/data")
async def create_item(item: dict):
    """
    POST endpoint that accepts JSON data and returns a confirmation
    """
    return {
        "message": "Data received successfully",
        "received_data": item,
        "status": "success"
    }

@app.get("/")
async def root():
    return {"message": "Welcome to the FastAPI endpoint"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
