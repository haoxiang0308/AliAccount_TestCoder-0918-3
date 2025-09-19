#!/usr/bin/env python3
"""
A simple script to set a key-value pair in Redis.
"""

import redis
import uuid

def main():
    # Connect to Redis server
    # Assuming Redis is running on localhost with default port 6379
    try:
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        
        # Test the connection
        r.ping()
        print("Connected to Redis successfully!")
        
        # Generate a random key and value
        random_key = f"key_{str(uuid.uuid4())[:8]}"
        random_value = f"value_{str(uuid.uuid4())[:8]}"
        
        # Set the key-value pair in Redis
        r.set(random_key, random_value)
        print(f"Set {random_key} => {random_value}")
        
        # Verify by getting the value back
        retrieved_value = r.get(random_key)
        print(f"Retrieved {random_key} => {retrieved_value}")
        
        # Check if the operation was successful
        if retrieved_value == random_value:
            print("Key-value pair successfully stored and verified in Redis!")
        else:
            print("Error: The stored value doesn't match the retrieved value.")
            
    except redis.ConnectionError:
        print("Error: Could not connect to Redis server. Please ensure Redis is running.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()