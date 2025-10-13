import random
import string
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or standard Atlas connection string)
# Replace the connection string below with your actual MongoDB connection string if needed.
client = MongoClient('mongodb://localhost:27017/') # Or your connection string

# Select the database and collection
db = client['test_database']
collection = db['test_collection']

# Create a sample document to insert
document_to_insert = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
}

# Insert the document into the collection
insert_result = collection.insert_one(document_to_insert)

print(f"Document inserted with ID: {insert_result.inserted_id}")

# Close the connection
client.close()
