import pymongo
import random
import string
import datetime

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def insert_document():
    """Connect to MongoDB and insert a sample document"""
    try:
        # Connect to MongoDB (assumes MongoDB is running locally)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create or connect to a database
        db = client["sample_db"]
        
        # Create or connect to a collection
        collection = db["sample_collection"]
        
        # Create a sample document to insert
        document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "city": "New York",
            "timestamp": datetime.datetime.utcnow()
        }
        
        # Insert the document
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
        
    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please make sure MongoDB is running.")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

def save_script_with_random_name():
    """Save this script with a random name"""
    import os
    
    # Read the current script content
    current_script_path = __file__
    with open(current_script_path, 'r') as f:
        script_content = f.read()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the content to the new file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    return random_filename

if __name__ == "__main__":
    # Save this script with a random name
    random_filename = save_script_with_random_name()
    
    print(f"Script saved with random name: {random_filename}")
    
    # Insert a document
    doc_id = insert_document()
    
    if doc_id:
        print(f"Successfully inserted document with ID: {doc_id}")
    else:
        print("Failed to insert document, but script was saved with random name")