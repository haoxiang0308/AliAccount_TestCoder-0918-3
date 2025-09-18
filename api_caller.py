import requests
import json
import random
import string
import os
import sys

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"api_script_{random_chars}.py"

def call_rest_api(url):
    """Call a REST API and return the response"""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

def save_script_to_random_file():
    """Save this script to a new file with a random name"""
    # Get the current script's content
    current_script = '''
import requests
import json
import random
import string
import os
import sys

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"api_script_{random_chars}.py"

def call_rest_api(url):
    """Call a REST API and return the response"""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

def save_script_to_random_file():
    """Save this script to a new file with a random name"""
    # Get the current script's content
    current_script = open(__file__).read()
    
    # Generate a random filename
    new_filename = generate_random_filename()
    
    # Write the content to the new file
    with open(new_filename, 'w') as f:
        f.write(current_script)
    
    print(f"Script saved to: {new_filename}")
    return new_filename

def main():
    # Example API endpoint (JSONPlaceholder is a free testing API)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print(f"Calling REST API: {api_url}")
    data = call_rest_api(api_url)
    
    if data:
        print("API Response:")
        print(json.dumps(data, indent=2))
        
        # Save this script to a new random file
        new_file = save_script_to_random_file()
    else:
        print("Failed to retrieve data from API")

if __name__ == "__main__":
    main()
'''
    
    # Generate a random filename
    new_filename = generate_random_filename()
    
    # Write the content to the new file
    with open(new_filename, 'w') as f:
        f.write(current_script)
    
    print(f"Script saved to: {new_filename}")
    return new_filename

def main():
    # Example API endpoint (JSONPlaceholder is a free testing API)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print(f"Calling REST API: {api_url}")
    data = call_rest_api(api_url)
    
    if data:
        print("API Response:")
        print(json.dumps(data, indent=2))
        
        # Save this script to a new random file
        new_file = save_script_to_random_file()
    else:
        print("Failed to retrieve data from API")

if __name__ == "__main__":
    main()