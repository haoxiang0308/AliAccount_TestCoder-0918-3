import redis

# Connect to Redis (assuming default localhost:6379)
try:
    r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
    
    # Set a key-value pair
    key = 'example_key'
    value = 'example_value'
    r.set(key, value)
    
    print(f'Successfully set {key} = {value} in Redis')
    
    # Verify the value was set
    retrieved_value = r.get(key)
    print(f'Retrieved {key} = {retrieved_value} from Redis')
    
except redis.ConnectionError:
    print('Could not connect to Redis server. Please make sure Redis is running.')
except Exception as e:
    print(f'An error occurred: {e}')
