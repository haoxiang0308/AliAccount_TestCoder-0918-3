import redis

# Connect to Redis server
r = redis.Redis(host='localhost', port=6379, db=0)

# Set a key-value pair
r.set('my_key', 'my_value')

print("Key-value pair set in Redis: my_key -> my_value")