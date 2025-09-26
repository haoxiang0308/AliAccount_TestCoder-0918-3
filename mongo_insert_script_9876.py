import random
from pymongo import MongoClient

# This script connects to a local MongoDB instance,
# creates a database named 'my_database',
# a collection named 'my_collection',
# and inserts a single document with a random number.

# 1. Connect to MongoDB (assumes MongoDB is running on localhost:27017)
client = MongoClient('mongodb://localhost:27017/')

# 2. Access the database (it will be created if it doesn't exist)
db = client['my_database']

# 3. Access the collection (it will be created if it doesn't exist)
collection = db['my_collection']

# 4. Create a document to insert
document_to_insert = {
    "name": "Sample Document",
    "value": random.randint(1, 100),
    "description": "This is a randomly generated document for insertion."
}

# 5. Insert the document into the collection
insert_result = collection.insert_one(document_to_insert)

# 6. Print the ID of the inserted document
print(f"Document inserted with ID: {insert_result.inserted_id}")

# 7. Close the connection (optional, as it's done automatically when the script ends)
client.close()
