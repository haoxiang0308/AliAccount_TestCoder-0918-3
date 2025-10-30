#!/usr/bin/env python3
"""
Simple PyMongo script to insert a document into MongoDB
"""

from pymongo import MongoClient
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def insert_document():
    """
    Connect to MongoDB and insert a sample document
    """
    try:
        # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
        client = MongoClient('mongodb://localhost:27017/')
        
        # Create or access a database
        db = client['sample_database']
        
        # Create or access a collection
        collection = db['sample_collection']
        
        # Create a sample document to insert
        sample_document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "city": "New York",
            "timestamp": "2023-10-30"
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
    except Exception as e:
        print(f"Error connecting to MongoDB: {e}")
        print("Note: MongoDB must be running for the insert operation to work")
        return None

if __name__ == "__main__":
    inserted_id = insert_document()
    if inserted_id:
        print(f"Successfully inserted document with ID: {inserted_id}")
    else:
        print("Could not insert document due to MongoDB connection issues")
