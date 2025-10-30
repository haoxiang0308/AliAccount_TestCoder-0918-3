from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional
import uuid

app = FastAPI()

# Define a request model
class ItemRequest(BaseModel):
    name: str
    description: Optional[str] = None
    value: float

# Define a response model
class ItemResponse(BaseModel):
    id: str
    name: str
    description: Optional[str] = None
    value: float

@app.post("/items/", response_model=ItemResponse)
async def create_item(item: ItemRequest):
    """
    Create a new item with a POST request
    """
    # Generate a random ID for the new item
    item_id = str(uuid.uuid4())
    
    # Create the response object
    response = ItemResponse(
        id=item_id,
        name=item.name,
        description=item.description,
        value=item.value
    )
    
    return response

# Health check endpoint
@app.get("/health")
async def health_check():
    return {"status": "healthy"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)