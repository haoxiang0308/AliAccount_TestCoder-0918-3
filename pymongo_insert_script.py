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
    """
    Connect to MongoDB and insert a sample document
    """
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

def save_script_to_random_file():
    """
    Save this script to a randomly named .py file
    """
    script_content = '''#!/usr/bin/env python3
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
    """
    Connect to MongoDB and insert a sample document
    """
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

if __name__ == "__main__":
    inserted_id = insert_document()
    print(f"Successfully inserted document with ID: {inserted_id}")
'''
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the script content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    inserted_id = insert_document()
    print(f"Successfully inserted document with ID: {inserted_id}")
    
    # Save this script to a randomly named file
    random_file = save_script_to_random_file()
    print(f"Also saved this script to a new random file: {random_file}")