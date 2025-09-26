import random
import string
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or correctly configured remote instance)
client = MongoClient('mongodb://localhost:27017/')

# Access a database (creates it if it doesn't exist)
db = client['my_test_database']

# Access a collection (creates it if it doesn't exist)
collection = db['my_test_collection']

# Generate a random filename for the script
random_filename = 'generated_script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Define the document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "script_filename": random_filename
}

# Insert the document into the collection
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")
print(f"Script saved as: {random_filename}")

# Close the connection
client.close()
