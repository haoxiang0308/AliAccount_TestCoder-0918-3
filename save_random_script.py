import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def save_script_to_random_file():
    """Save the API script to a randomly named file"""
    # The content of our API script
    api_script_content = '''import requests
import json
import random
import string

def call_rest_api():
    """
    Function to call a REST API and print the response
    """
    try:
        # Using JSONPlaceholder as a sample API
        url = "https://jsonplaceholder.typicode.com/posts/1"
        
        # Make a GET request
        response = requests.get(url)
        
        # Raise an exception for bad status codes
        response.raise_for_status()
        
        # Parse the JSON response
        data = response.json()
        
        print("API Response:")
        print(json.dumps(data, indent=2))
        
        return data
        
    except requests.exceptions.RequestException as e:
        print(f"Error occurred while calling the API: {e}")
        return None

if __name__ == "__main__":
    call_rest_api()
'''
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(api_script_content)
    
    print(f"API script saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    save_script_to_random_file()