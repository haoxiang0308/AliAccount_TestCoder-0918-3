#!/usr/bin/env python3
"""
A Python script that connects to Redis and sets a key-value pair.
"""

import redis
import random
import string

def generate_random_value(length=10):
    """Generate a random string of specified length."""
    letters = string.ascii_letters + string.digits
    return ''.join(random.choice(letters) for i in range(length))

def set_redis_key_value():
    """Connect to Redis and set a key-value pair."""
    try:
        # Connect to Redis (assumes Redis is running on localhost:6379)
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        
        # Generate a random key and value
        random_key = f"random_key_{generate_random_value(8)}"
        random_value = f"random_value_{generate_random_value(12)}"
        
        # Set the key-value pair in Redis
        result = r.set(random_key, random_value)
        
        if result:
            print(f"Successfully set key '{random_key}' with value '{random_value}' in Redis")
        else:
            print("Failed to set key-value in Redis")
            
        # Verify the value was set
        retrieved_value = r.get(random_key)
        print(f"Retrieved value for key '{random_key}': {retrieved_value}")
        
    except redis.ConnectionError:
        print("Error: Could not connect to Redis server. Please make sure Redis is running.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    set_redis_key_value()