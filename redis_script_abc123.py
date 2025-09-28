import redis

# Connect to Redis server
r = redis.Redis(host='localhost', port=6379, db=0)

# Set a key-value pair
key = "my_key"
value = "my_value"
r.set(key, value)

print(f"Set {key} = {value}")