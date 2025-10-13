import random
import string
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or modify connection string)
client = MongoClient('mongodb://localhost:27017/')

# Access a database (creates it if it doesn't exist)
db = client['sample_database']

# Access a collection (creates it if it doesn't exist)
collection = db['sample_collection']

# Generate a random document
random_document = {
    "name": "Sample Document",
    "value": random.randint(1, 100),
    "description": "This is a randomly generated document.",
    "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=10))
}

# Insert the document into the collection
result = collection.insert_one(random_document)

print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
