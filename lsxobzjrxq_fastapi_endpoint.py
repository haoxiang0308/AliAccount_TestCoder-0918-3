from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional
import uuid

app = FastAPI()

# Define a model for the request body
class Item(BaseModel):
    name: str
    description: Optional[str] = None
    value: float

# POST endpoint that accepts JSON data
@app.post("/items/")
async def create_item(item: Item):
    """
    Accepts a POST request with item data and returns the created item with an ID
    """
    # Generate a random ID for the new item
    item_id = str(uuid.uuid4())
    
    # Return the created item with its ID
    return {
        "id": item_id,
        "name": item.name,
        "description": item.description,
        "value": item.value,
        "message": "Item created successfully"
    }

# Health check endpoint
@app.get("/")
async def root():
    return {"message": "FastAPI POST endpoint is running!"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)