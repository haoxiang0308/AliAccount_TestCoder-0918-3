import pymongo
import random
import string

# Generate a random collection name for this example
random_collection_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

# Connect to MongoDB (assumes MongoDB is running locally on default port)
try:
    client = pymongo.MongoClient("mongodb://localhost:27017/")
    
    # Create/access database
    db = client["sample_db"]
    
    # Create/access collection
    collection = db[random_collection_name]
    
    # Document to insert
    sample_document = {
        "name": "John Doe",
        "age": 30,
        "email": "john.doe@example.com",
        "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=10)),
        "timestamp": "2023-01-01T00:00:00Z"
    }
    
    # Insert the document
    result = collection.insert_one(sample_document)
    
    print(f"Document inserted with ID: {result.inserted_id}")
    print(f"Collection name: {random_collection_name}")
    print(f"Database: sample_db")
    
    # Verify the document was inserted by finding it
    inserted_doc = collection.find_one({"_id": result.inserted_id})
    print(f"Inserted document: {inserted_doc}")
    
except pymongo.errors.ConnectionFailure:
    print("Could not connect to MongoDB. Please ensure MongoDB is running.")
except Exception as e:
    print(f"An error occurred: {e}")
finally:
    # Close the connection
    client.close()