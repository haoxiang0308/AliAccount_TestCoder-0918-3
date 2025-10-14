from fastapi import FastAPI
import uuid

app = FastAPI()

@app.post("/data/")
async def receive_data():
    # Generate a random filename
    random_filename = f"received_data_{uuid.uuid4().hex}.txt"
    
    # Example: Save some data to the file
    with open(random_filename, 'w') as f:
        f.write("This is some example data received from the POST request.")
    
    return {"message": "Data received and saved", "filename": random_filename}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)