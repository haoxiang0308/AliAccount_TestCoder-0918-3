import random
import string
from pymongo import MongoClient

# --- Configuration ---
MONGO_URI = "mongodb://localhost:27017/"  # Replace with your MongoDB URI
DB_NAME = "test_database"
COLLECTION_NAME = "test_collection"

# --- Generate Random Document ---
def generate_random_document():
    """Generates a dictionary with random data."""
    random_id = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    random_name = ''.join(random.choices(string.ascii_letters, k=6))
    random_age = random.randint(18, 80)
    return {
        "id": random_id,
        "name": random_name,
        "age": random_age
    }

# --- Main Execution ---
if __name__ == "__main__":
    # Connect to MongoDB
    client = MongoClient(MONGO_URI)
    db = client[DB_NAME]
    collection = db[COLLECTION_NAME]

    # Generate and insert a random document
    document_to_insert = generate_random_document()
    print(f"Inserting document: {document_to_insert}")
    result = collection.insert_one(document_to_insert)
    print(f"Document inserted with ID: {result.inserted_id}")

    # Close the connection
    client.close()
    print("Connection closed.")