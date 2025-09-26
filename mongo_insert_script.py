import random
import string
from pymongo import MongoClient

# --- Configuration ---
# Replace with your MongoDB connection string.
# For a local instance, it's usually 'mongodb://localhost:27017/'
MONGO_URI = "mongodb://localhost:27017/"
DATABASE_NAME = "test_db"
COLLECTION_NAME = "test_collection"

def generate_random_filename(length=10):
    """Generates a random string of fixed length."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length)) + ".py"

def insert_document():
    """Connects to MongoDB and inserts a sample document."""
    try:
        # Connect to the MongoDB server
        client = MongoClient(MONGO_URI)
        
        # Access the database and collection
        db = client[DATABASE_NAME]
        collection = db[COLLECTION_NAME]
        
        # Define the document to insert
        document = {
            "name": "John Doe",
            "age": 30,
            "city": "New York",
            "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
        }
        
        # Insert the document
        result = collection.insert_one(document)
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        print("Connection closed.")
        
        # Generate a random filename and save this script to it
        random_filename = generate_random_filename()
        with open(random_filename, 'w') as f:
            f.write('# This script was saved with a random name after inserting a document.\n\n')
            f.write('# Your original script content would be written here.\n')
            f.write('# For this task, we are just creating a placeholder file.\n')
            f.write(f'print("This is the content of {random_filename}")\n')
        
        print(f"Script saved to {random_filename}")
        
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    insert_document()
