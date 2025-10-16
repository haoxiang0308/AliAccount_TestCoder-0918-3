import requests
import random
import string

def call_rest_api():
    """
    Calls a REST API and returns the response
    """
    # Using JSONPlaceholder as a demo API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        print(f"Status Code: {response.status_code}")
        print(f"Response: {response.json()}")
        
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error making API request: {e}")
        return None

def generate_random_filename():
    """
    Generates a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

if __name__ == "__main__":
    # Call the API
    data = call_rest_api()
    
    # Generate random filename
    random_filename = generate_random_filename()
    print(f"Saving script to: {random_filename}")
    
    # Write this script to a new file with random name
    with open(__file__, 'r') as original_file:
        script_content = original_file.read()
    
    with open(random_filename, 'w') as new_file:
        new_file.write(script_content)
    
    print(f"Script saved to {random_filename}")