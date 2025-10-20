import pymongo
import random
import string

# Create a connection to MongoDB (assuming MongoDB is running locally on default port 27017)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Create or connect to a database
db = client["test_database"]

# Create or connect to a collection
collection = db["test_collection"]

# Create a sample document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "email": "john.doe@example.com",
    "city": "New York",
    "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=10))
}

# Insert the document into the collection
result = collection.insert_one(document)

# Print the inserted document's ID
print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()

print("Document successfully inserted into MongoDB!")
