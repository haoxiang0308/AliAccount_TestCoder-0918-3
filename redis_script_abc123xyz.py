import redis
import random
import string

# Connect to Redis (assumes Redis is running on localhost:6379)
r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)

# Generate a random key name
random_key = 'key_' + ''.join(random.choices(string.ascii_letters + string.digits, k=8))
random_value = 'value_' + ''.join(random.choices(string.ascii_letters + string.digits, k=12))

# Set the key-value pair in Redis
r.set(random_key, random_value)

print(f"Set key '{random_key}' with value '{random_value}' in Redis.")