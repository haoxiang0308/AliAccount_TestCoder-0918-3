import redis
import random
import string

# Connect to Redis (adjust host/port if needed)
r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)

# Generate a random key name
random_key = ''.join(random.choices(string.ascii_letters + string.digits, k=10))

# Set a key-value pair in Redis
r.set(random_key, 'Hello, Redis!')

print(f"Set key '{random_key}' with value 'Hello, Redis!' in Redis.")