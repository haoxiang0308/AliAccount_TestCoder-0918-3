#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API.
This script fetches data from a public API and prints the response.
"""

import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def fetch_api_data(url):
    """Fetch data from the provided API URL."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data from API: {e}")
        return None

def save_script_with_random_name():
    """Save this script with a random name."""
    # This script's content
    script_content = '''#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API.
This script fetches data from a public API and prints the response.
"""

import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def fetch_api_data(url):
    """Fetch data from the provided API URL."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data from API: {e}")
        return None

def main():
    # Using a public API for demonstration (JSONPlaceholder)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print("Fetching data from API...")
    data = fetch_api_data(api_url)
    
    if data:
        print("API Response:")
        print(json.dumps(data, indent=2))
        
        # Generate a random filename and save the data
        random_filename = generate_random_filename()
        with open(random_filename, 'w') as f:
            json.dump(data, f, indent=2)
        print(f"\\nData saved to {random_filename}")
    else:
        print("Failed to fetch data from the API")

if __name__ == "__main__":
    main()
'''
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the script content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved with random name: {random_filename}")

def main():
    # Using a public API for demonstration (JSONPlaceholder)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print("Fetching data from API...")
    data = fetch_api_data(api_url)
    
    if data:
        print("API Response:")
        print(json.dumps(data, indent=2))
        
        # Generate a random filename and save the data
        random_filename = generate_random_filename()
        with open(random_filename, 'w') as f:
            json.dump(data, f, indent=2)
        print(f"\nData saved to {random_filename}")
    else:
        print("Failed to fetch data from the API")

if __name__ == "__main__":
    main()