import random
import string
from pymongo import MongoClient

# Connect to MongoDB (replace with your connection string if different)
client = MongoClient('mongodb://localhost:27017/')
db = client['my_database']
collection = db['my_collection']

# Create a sample document
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York"
}

# Insert the document
result = collection.insert_one(document)
print(f"Document inserted with ID: {result.inserted_id}")

# Generate a random filename
random_filename = 'mongo_script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Save this script to the random filename
with open(random_filename, 'w') as f:
    f.write('# Generated script to insert a document into MongoDB\n')
    f.write('from pymongo import MongoClient\n\n')
    f.write('# Connect to MongoDB\n')
    f.write("client = MongoClient('mongodb://localhost:27017/')\n")
    f.write("db = client['my_database']\n")
    f.write("collection = db['my_collection']\n\n")
    f.write('# Document to insert\n')
    f.write("document = {\n    \"name\": \"Jane Smith\",\n    \"age\": 25,\n    \"city\": \"San Francisco\"\n}\n\n")
    f.write('# Insert the document\n')
    f.write('result = collection.insert_one(document)\n')
    f.write("print(f'Document inserted with ID: {result.inserted_id}')\n")

print(f"Script saved to {random_filename}")

# Close the connection
client.close()
