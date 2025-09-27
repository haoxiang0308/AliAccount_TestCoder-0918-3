import random
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or standard cluster)
# Replace the URI with your specific connection string if different
client = MongoClient('mongodb://localhost:27017/') # Or your MongoDB URI

# Access a database (it will be created if it doesn't exist)
db = client['sample_database']

# Access a collection (it will be created if it doesn't exist)
collection = db['sample_collection']

# Define a sample document to insert
document_to_insert = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": random.randint(1000, 9999)  # Add a random element
}

# Insert the document into the collection
insert_result = collection.insert_one(document_to_insert)

print(f"Document inserted with ID: {insert_result.inserted_id}")

# Close the connection
client.close()
