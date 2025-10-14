import redis

# Connect to Redis server (assumes default localhost:6379)
r = redis.Redis(decode_responses=True)

# Set a key-value pair
key = "my_key"
value = "my_value"
r.set(key, value)

print(f"Set key '{key}' with value '{value}' in Redis.")