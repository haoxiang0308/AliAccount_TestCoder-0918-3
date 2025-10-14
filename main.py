from fastapi import FastAPI
import uuid

app = FastAPI()

@app.post("/data/")
async def receive_data():
    # Generate a random filename
    random_filename = f"/workspace/data_{uuid.uuid4().hex}.py"
    
    # Content to write to the file
    content = '''# This is a randomly generated file
print("Hello from the randomly generated file!")'''

    # Write the content to the file
    with open(random_filename, 'w') as f:
        f.write(content)
    
    return {"message": f"Data saved successfully to {random_filename}"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)