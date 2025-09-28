import random
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or modify the URI)
client = MongoClient('mongodb://localhost:27017/')

# Access a database (creates it if it doesn't exist)
db = client['sample_database']

# Access a collection (creates it if it doesn't exist)
collection = db['sample_collection']

# Create a sample document to insert
document_to_insert = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": random.randint(1000, 9999)  # Add a random element
}

# Insert the document into the collection
result = collection.insert_one(document_to_insert)

# Print the ID of the inserted document
print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
