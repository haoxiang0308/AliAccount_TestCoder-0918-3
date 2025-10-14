import random
import string
from pymongo import MongoClient

# --- Configuration ---
MONGO_URI = "mongodb://localhost:27017/"  # Replace with your MongoDB URI if different
DB_NAME = "test_database"
COLLECTION_NAME = "test_collection"

# --- Generate Random Filename ---
def generate_random_filename(length=10):
    """Generates a random string of fixed length."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length)) + ".py"

# --- Main Script ---
if __name__ == "__main__":
    # Connect to MongoDB
    client = MongoClient(MONGO_URI)
    db = client[DB_NAME]
    collection = db[COLLECTION_NAME]

    # Document to insert
    document = {
        "name": "John Doe",
        "age": 30,
        "city": "New York",
        "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    }

    try:
        # Insert the document
        result = collection.insert_one(document)
        print(f"Document inserted with ID: {result.inserted_id}")

        # Generate a random filename
        random_filename = generate_random_filename()
        print(f"Saving script to randomly named file: {random_filename}")

        # Save this script to the randomly named file
        with open(random_filename, 'w') as f:
            f.write('# Generated MongoDB Insert Script\n')
            f.write('# Document inserted: ' + str(document) + '\n\n')
            f.write('# PyMongo code to insert a document\n')
            f.write('from pymongo import MongoClient\n\n')
            f.write(f'client = MongoClient("{MONGO_URI}")\n')
            f.write(f'db = client["{DB_NAME}"]\n')
            f.write(f'collection = db["{COLLECTION_NAME}"]\n\n')
            f.write(f'doc = {document}\n')
            f.write('result = collection.insert_one(doc)\n')
            f.write('print(f"Inserted document with ID: {result.inserted_id}")\n')

        print(f"Script saved successfully to {random_filename}.")

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        # Close the MongoDB connection
        client.close()
