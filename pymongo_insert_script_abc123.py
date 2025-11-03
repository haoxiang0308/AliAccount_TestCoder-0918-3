#!/usr/bin/env python3
"""
Python script using PyMongo to insert a document into MongoDB
"""

from pymongo import MongoClient
import random
import string

def generate_random_data():
    """Generate random data to insert into MongoDB"""
    random_name = ''.join(random.choices(string.ascii_letters, k=8))
    random_age = random.randint(18, 80)
    random_email = f"{random_name.lower()}@example.com"
    
    document = {
        "name": random_name,
        "age": random_age,
        "email": random_email,
        "created_at": "2025-01-01T00:00:00Z"
    }
    return document

def main():
    # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
    try:
        client = MongoClient('mongodb://localhost:27017/')
        
        # Create/access database
        db = client['test_database']
        
        # Create/access collection
        collection = db['users']
        
        # Generate and insert a random document
        document = generate_random_data()
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        print(f"Inserted document: {document}")
        
        # Close the connection
        client.close()
        
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()