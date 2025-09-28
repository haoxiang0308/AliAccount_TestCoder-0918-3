import pymongo
import random
import string

# Generate a random filename for the script itself
random_filename = 'mongo_insert_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# --- MongoDB Connection ---
# Replace these values with your actual MongoDB connection details
MONGO_URI = "mongodb://root:example@localhost:27017/"  # Example URI for local MongoDB
DATABASE_NAME = "test_db"
COLLECTION_NAME = "test_collection"

try:
    # Connect to the MongoDB client
    client = pymongo.MongoClient(MONGO_URI)
    
    # Access the specific database and collection
    db = client[DATABASE_NAME]
    collection = db[COLLECTION_NAME]

    # --- Document to Insert ---
    document_to_insert = {
        "name": "John Doe",
        "age": 30,
        "city": "New York",
        "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=10)) # Add a unique field
    }

    # Insert the document into the collection
    result = collection.insert_one(document_to_insert)

    print(f"Document inserted successfully with ID: {result.inserted_id}")
    print(f"Saved this script as: {random_filename}")

    # Save this script with the random filename
    import shutil
    shutil.copy(__file__, random_filename)
    print(f"Script saved as {random_filename}")

except pymongo.errors.ConnectionFailure:
    print("ERROR: Could not connect to MongoDB. Please check your connection string.")
except pymongo.errors.PyMongoError as e:
    print(f"ERROR: An error occurred with PyMongo: {e}")
except Exception as e:
    print(f"An unexpected error occurred: {e}")
finally:
    # Close the connection to the client
    if 'client' in locals():
        client.close()
        print("MongoDB connection closed.")