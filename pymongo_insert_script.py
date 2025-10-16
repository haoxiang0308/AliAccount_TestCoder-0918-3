#!/usr/bin/env python3
"""
A Python script using PyMongo to insert a document into MongoDB.
This script connects to a MongoDB instance and inserts a sample document.
"""

from pymongo import MongoClient
import random
import string


def generate_random_collection_name():
    """Generate a random collection name."""
    return 'collection_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))


def insert_document():
    """
    Connects to MongoDB and inserts a sample document.
    """
    # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
    client = MongoClient('mongodb://localhost:27017/')
    
    # Create a random database name
    db_name = 'test_db_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=6))
    db = client[db_name]
    
    # Create a random collection name
    collection_name = generate_random_collection_name()
    collection = db[collection_name]
    
    # Sample document to insert
    sample_document = {
        "name": "John Doe",
        "email": f"john{random.randint(1000, 9999)}@example.com",
        "age": random.randint(18, 65),
        "city": random.choice(["New York", "Los Angeles", "Chicago", "Houston", "Phoenix"]),
        "created_at": "2023-01-01"
    }
    
    # Insert the document
    result = collection.insert_one(sample_document)
    
    print(f"Document inserted with ID: {result.inserted_id}")
    print(f"Database: {db_name}")
    print(f"Collection: {collection_name}")
    
    # Verify the document was inserted
    retrieved_doc = collection.find_one({"_id": result.inserted_id})
    print(f"Retrieved document: {retrieved_doc}")
    
    # Close the connection
    client.close()


if __name__ == "__main__":
    insert_document()