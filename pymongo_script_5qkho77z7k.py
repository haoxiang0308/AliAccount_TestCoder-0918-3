#!/usr/bin/env python3
"""
A Python script using PyMongo to insert a document into MongoDB
"""

from pymongo import MongoClient
import random
import string


def generate_random_collection_name():
    """Generate a random collection name"""
    return 'collection_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))


def insert_document():
    # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
    client = MongoClient('mongodb://localhost:27017/')
    
    # Create/use a test database
    db = client['test_database']
    
    # Generate a random collection name
    collection_name = generate_random_collection_name()
    collection = db[collection_name]
    
    # Create a sample document to insert
    document = {
        "name": "John Doe",
        "email": "john.doe@example.com",
        "age": 30,
        "city": "New York",
        "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=10)),
        "timestamp": "2023-01-01T00:00:00Z"
    }
    
    # Insert the document
    result = collection.insert_one(document)
    
    print(f"Document inserted with ID: {result.inserted_id}")
    print(f"Collection name: {collection_name}")
    print(f"Database name: {db.name}")
    
    # Verify the document was inserted
    retrieved_doc = collection.find_one({"_id": result.inserted_id})
    print(f"Retrieved document: {retrieved_doc}")
    
    # Close the connection
    client.close()
    
    return result.inserted_id


if __name__ == "__main__":
    insert_document()