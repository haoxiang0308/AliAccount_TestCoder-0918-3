import pymongo
import random
import string

def insert_document_example():
    """Example function to insert a document using PyMongo"""
    try:
        # Connect to MongoDB (assuming local MongoDB instance)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create or connect to a database
        db = client["example_db"]
        
        # Create or connect to a collection
        collection = db["example_collection"]
        
        # Create a sample document to insert
        document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "city": "New York",
            "timestamp": "2023-01-01T00:00:00Z"
        }
        
        # Insert the document
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
        
    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please make sure MongoDB is running.")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

if __name__ == "__main__":
    print("Inserting document into MongoDB...")
    inserted_id = insert_document_example()
    
    if inserted_id:
        print(f"Successfully inserted document with ID: {inserted_id}")
    else:
        print("Failed to insert document")
