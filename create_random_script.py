import pymongo
import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}.py"

def create_pymongo_script_with_random_name():
    """Create a PyMongo script and save it with a random filename"""
    
    # The PyMongo script content
    script_content = '''import pymongo
import random
import string

def insert_document_example():
    """Example function to insert a document using PyMongo"""
    try:
        # Connect to MongoDB (assuming local MongoDB instance)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create or connect to a database
        db = client["example_db"]
        
        # Create or connect to a collection
        collection = db["example_collection"]
        
        # Create a sample document to insert
        document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "city": "New York",
            "timestamp": "2023-01-01T00:00:00Z"
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

if __name__ == "__main__":
    print("Inserting document into MongoDB...")
    inserted_id = insert_document_example()
    
    if inserted_id:
        print(f"Successfully inserted document with ID: {inserted_id}")
    else:
        print("Failed to insert document")
'''
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the script to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(script_content)
    
    print(f"PyMongo script created and saved as: {random_filename}")
    return random_filename

if __name__ == "__main__":
    created_file = create_pymongo_script_with_random_name()
    print(f"Script saved successfully to: {os.path.join(os.getcwd(), created_file)}")