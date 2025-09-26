import pymongo
import random
import string

# Connect to MongoDB (assumes a local instance or adjust the URI)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Access a database (creates it if it doesn't exist)
db = client["sample_db"]

# Access a collection (creates it if it doesn't exist)
collection = db["sample_collection"]

# Generate a random document
random_id = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
document = {
    "id": random_id,
    "name": "Sample Document",
    "value": random.randint(1, 100),
    "status": "active"
}

# Insert the document into the collection
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")
print(f"Inserted document: {document}")

# Close the connection
client.close()
