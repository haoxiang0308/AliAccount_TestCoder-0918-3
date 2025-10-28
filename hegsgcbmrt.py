from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional
import uvicorn

app = FastAPI()

# Define a request body model
class Item(BaseModel):
    name: str
    description: Optional[str] = None
    price: float
    tax: Optional[float] = None

# POST endpoint
@app.post("/items/")
async def create_item(item: Item):
    """
    Accepts a POST request with item data and returns the received data with an ID
    """
    # Simulate creating an item with an ID
    item_dict = item.dict()
    item_dict.update({"id": 123})
    return item_dict

# Health check endpoint
@app.get("/")
async def root():
    return {"message": "FastAPI POST endpoint is running!"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)