#!/usr/bin/env python3
"""
A script to insert a document into a MongoDB collection using PyMongo.
This script connects to a local MongoDB instance and inserts a sample document.
"""

import random
import string
from pymongo import MongoClient


def random_string(length=10):
    """Generate a random string of fixed length."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for _ in range(length))


def main():
    # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
    # If MongoDB is not available, this will raise an exception.
    try:
        client = MongoClient('localhost', 27017, serverSelectionTimeoutMS=5000) # 5 second timeout

        # Access a database (creates it if it doesn't exist)
        db = client['sample_db']

        # Access a collection (creates it if it doesn't exist)
        collection = db['sample_collection']

        # Create a sample document to insert
        sample_document = {
            "name": "John Doe",
            "email": f"john.doe.{random_string()}@example.com",
            "age": 30,
            "city": "New York",
            "random_id": random_string(15)
        }

        # Insert the document into the collection
        result = collection.insert_one(sample_document)

        print(f"Document inserted with ID: {result.inserted_id}")

        # Close the MongoDB connection
        client.close()

    except Exception as e:
        print(f"An error occurred while trying to connect to MongoDB or insert the document: {e}")
        print("The script will now exit. Please ensure MongoDB is running before executing.")


if __name__ == "__main__":
    main()