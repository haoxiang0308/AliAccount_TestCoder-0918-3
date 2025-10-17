import pymongo
import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def insert_document():
    # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
    try:
        client = pymongo.MongoClient("mongodb://localhost:27017/", serverSelectionTimeoutMS=3000)  # 3 second timeout
        
        # Test connection
        client.admin.command('ping')
        
        # Create/access database
        db = client["sample_db"]
        
        # Create/access collection
        collection = db["sample_collection"]
        
        # Document to insert
        sample_document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "city": "New York",
            "timestamp": {"$date": "2023-01-01T00:00:00Z"},
            "created_at": {"$date": "2023-01-01T00:00:00Z"}
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Verify the insertion by finding the document
        inserted_doc = collection.find_one({"_id": result.inserted_id})
        print(f"Verified document: {inserted_doc}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
        
    except pymongo.errors.ServerSelectionTimeoutError:
        print("Could not connect to MongoDB. Please ensure MongoDB is running.")
        print("For this demonstration, we'll create the random file without connecting to MongoDB.")
        return "mock_id_for_demo"

if __name__ == "__main__":
    inserted_id = insert_document()
    
    # Generate a random filename and save this script to that file
    random_filename = generate_random_filename()
    
    # Read the current script content
    with open(__file__, 'r') as original_file:
        script_content = original_file.read()
    
    # Write the script content to the randomly named file
    with open(random_filename, 'w') as new_file:
        new_file.write(script_content)
    
    print(f"Script has been saved to: {random_filename}")
    
    # List the new file to confirm it was created
    print("Files in current directory:")
    for file in os.listdir('.'):
        if file.endswith('.py') and file != 'pymongo_script_with_fallback.py':
            print(f"  - {file}")