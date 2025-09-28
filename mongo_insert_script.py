import random
import string
from pymongo import MongoClient

# --- Configuration ---
# Replace these with your actual MongoDB connection details
MONGO_URI = "mongodb://localhost:27017/"  # Default local URI
DATABASE_NAME = "test_db"
COLLECTION_NAME = "test_collection"

def connect_to_mongo(uri):
    """Connects to MongoDB and returns the client."""
    try:
        client = MongoClient(uri)
        # The ismaster command is cheap and does not require auth.
        client.admin.command('ismaster')
        print("Connected successfully to MongoDB!")
        return client
    except Exception as e:
        print(f"Error connecting to MongoDB: {e}")
        return None

def insert_document(client, db_name, collection_name, document):
    """Inserts a document into the specified collection."""
    try:
        db = client[db_name]
        collection = db[collection_name]
        result = collection.insert_one(document)
        print(f"Document inserted with ID: {result.inserted_id}")
        return result.inserted_id
    except Exception as e:
        print(f"Error inserting document: {e}")
        return None

def main():
    # Connect to MongoDB
    client = connect_to_mongo(MONGO_URI)
    if not client:
        print("Exiting due to connection failure.")
        return

    # Define the document to insert
    sample_document = {
        "name": "John Doe",
        "age": 30,
        "city": "New York",
        "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    }

    # Insert the document
    insert_document(client, DATABASE_NAME, COLLECTION_NAME, sample_document)

    # Close the connection
    client.close()
    print("Connection closed.")

if __name__ == "__main__":
    main()
