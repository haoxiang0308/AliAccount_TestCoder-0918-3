from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Optional

# Initialize FastAPI app
app = FastAPI(title="Sample API", description="A simple FastAPI application with a POST endpoint")

# Define a data model for the POST request body
class Item(BaseModel):
    name: str
    description: Optional[str] = None
    price: float
    tax: Optional[float] = None

# POST endpoint
@app.post("/items/")
async def create_item(item: Item):
    """
    Create a new item.
    
    Args:
        item (Item): The item to create.
        
    Returns:
        dict: A dictionary containing the item data and calculated price with tax.
    """
    # Calculate price with tax if tax is provided
    price_with_tax = item.price + (item.tax if item.tax else 0)
    
    # Return the item data along with the calculated price
    return {
        "item": item,
        "price_with_tax": price_with_tax,
        "message": "Item created successfully"
    }

# Health check endpoint
@app.get("/health")
async def health_check():
    """
    Health check endpoint.
    
    Returns:
        dict: A simple health status message.
    """
    return {"status": "healthy"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)