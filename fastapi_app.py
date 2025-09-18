from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import uuid
import json
import os

app = FastAPI()

class PostData(BaseModel):
    name: str
    email: str
    message: str

@app.post("/submit")
async def submit_data(data: PostData):
    # Generate a random filename
    filename = f"{uuid.uuid4().hex}.json"
    
    # Save data to file
    try:
        with open(filename, "w") as f:
            json.dump(data.dict(), f)
        # Also print to console for visibility
        print(f"Data saved to {filename}")
        return {"filename": filename, "message": "Data saved successfully"}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)