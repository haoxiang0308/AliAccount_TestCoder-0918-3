import random
import string
import pymongo
from pymongo import MongoClient

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"mongo_script_{random_chars}.py"

def insert_document():
    """Insert a document into MongoDB"""
    try:
        # Connect to MongoDB (assuming local instance)
        client = MongoClient('mongodb://localhost:27017/')
        
        # Access database and collection
        db = client['test_database']
        collection = db['test_collection']
        
        # Document to insert
        document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "interests": ["Python", "MongoDB", "AI"]
        }
        
        # Insert the document
        result = collection.insert_one(document)
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    insert_document()