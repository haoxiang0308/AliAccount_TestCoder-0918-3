#!/usr/bin/env python3
"""
A simple script to connect to Redis and set a key-value pair.
"""

import redis
import sys

def main():
    try:
        # Connect to Redis server
        # By default, it connects to localhost:6379
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        
        # Test the connection
        r.ping()
        print("Connected to Redis successfully!")
        
        # Set a key-value pair
        key = "example_key"
        value = "example_value"
        
        r.set(key, value)
        print(f"Set key '{key}' with value '{value}'")
        
        # Verify by getting the value
        retrieved_value = r.get(key)
        print(f"Retrieved value for '{key}': {retrieved_value}")
        
    except redis.ConnectionError:
        print("Error: Could not connect to Redis server. Make sure Redis is running.")
        sys.exit(1)
    except Exception as e:
        print(f"An error occurred: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()