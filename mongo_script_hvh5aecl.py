# Generated script to insert a document into MongoDB
from pymongo import MongoClient

# Connect to MongoDB
client = MongoClient('mongodb://localhost:27017/')
db = client['my_database']
collection = db['my_collection']

# Document to insert
document = {
    "name": "Jane Smith",
    "age": 25,
    "city": "San Francisco"
}

# Insert the document
result = collection.insert_one(document)
print(f'Document inserted with ID: {result.inserted_id}')
# Close the connection
client.close()
