import pymongo
import random
import string

# Connect to MongoDB (replace with your connection string if not local)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Specify the database and collection
db = client["my_test_db"]
collection = db["my_test_collection"]

# Generate a random document
random_document = {
    "name": "Random Item",
    "value": random.randint(1, 100),
    "description": "This is a randomly generated document.",
    "id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
}

# Insert the document
result = collection.insert_one(random_document)

print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
