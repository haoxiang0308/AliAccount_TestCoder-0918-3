import redis

# Connect to Redis (assumes Redis is running on localhost:6379)
try:
    r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
    print("Connected to Redis successfully!")
    
    # Set a key-value pair
    key = "example_key"
    value = "example_value"
    r.set(key, value)
    
    print(f"Set key '{key}' with value '{value}' in Redis")
    
    # Verify the value was set
    retrieved_value = r.get(key)
    print(f"Retrieved value for key '{key}': {retrieved_value}")
    
except redis.ConnectionError:
    print("Could not connect to Redis. Please make sure Redis server is running.")
except Exception as e:
    print(f"An error occurred: {e}")