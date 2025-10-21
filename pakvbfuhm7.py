#!/usr/bin/env python3
"""
A Python script using PyMongo to insert a document into MongoDB.
This script connects to a MongoDB instance and inserts a sample document.
"""

from pymongo import MongoClient
import random
import string
from datetime import datetime


def generate_random_document():
    """Generate a random document with various data types."""
    random_id = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    return {
        "name": f"Document_{random_id}",
        "value": random.randint(1, 100),
        "timestamp": datetime.now(),
        "description": f"This is a randomly generated document with ID: {random_id}",
        "category": random.choice(["A", "B", "C", "D"]),
        "active": random.choice([True, False])
    }


def main():
    # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
    try:
        client = MongoClient('mongodb://localhost:27017/')
        
        # Access a database (creates it if it doesn't exist)
        db = client['sample_database']
        
        # Access a collection (creates it if it doesn't exist)
        collection = db['sample_collection']
        
        # Generate and insert a random document
        document = generate_random_document()
        result = collection.insert_one(document)
        
        print(f"Document inserted successfully with ID: {result.inserted_id}")
        print(f"Inserted document: {document}")
        
        # Verify the insertion by finding the document
        inserted_doc = collection.find_one({"_id": result.inserted_id})
        print(f"Verified document: {inserted_doc}")
        
        # Close the connection
        client.close()
        
    except Exception as e:
        print(f"An error occurred: {e}")
        print("Make sure MongoDB is running on localhost:27017")


if __name__ == "__main__":
    main()