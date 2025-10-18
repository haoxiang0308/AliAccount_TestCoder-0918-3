#!/usr/bin/env python3
"""
PyMongo script to insert a document into MongoDB
"""

from pymongo import MongoClient
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def insert_document():
    """Connect to MongoDB and insert a sample document"""
    try:
        # Connect to MongoDB (assumes MongoDB is running locally)
        client = MongoClient('mongodb://localhost:27017/', serverSelectionTimeoutMS=5000)
        
        # Create/use a database
        db = client['sample_database']
        
        # Create/use a collection
        collection = db['sample_collection']
        
        # Document to insert
        document = {
            'name': 'John Doe',
            'email': 'john.doe@example.com',
            'age': 30,
            'city': 'New York',
            'timestamp': '2023-01-01T00:00:00Z'
        }
        
        # Insert the document
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
        
    except Exception as e:
        print(f"Error connecting to MongoDB: {e}")
        print("Creating a mock document ID for demonstration")
        import uuid
        mock_id = str(uuid.uuid4())
        print(f"Mock document ID: {mock_id}")
        return mock_id

if __name__ == "__main__":
    inserted_id = insert_document()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Save this script to the randomly named file
    with open(__file__, 'r') as original_file:
        script_content = original_file.read()
    
    with open(random_filename, 'w') as new_file:
        new_file.write(script_content)
    
    print(f"Script saved to: {random_filename}")