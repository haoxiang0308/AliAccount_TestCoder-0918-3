import requests
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"api_script_{random_chars}.py"

def call_rest_api_and_save(url):
    """Call a REST API and save the response to a randomly named Python file"""
    try:
        # Make the API call
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Generate random filename
        filename = generate_random_filename()
        
        # Create the content for the new script
        script_content = f'''#!/usr/bin/env python3
"""
Auto-generated script to call REST API
"""

import requests
import json

def fetch_data():
    """Fetch data from the API endpoint"""
    url = "{url}"
    try:
        response = requests.get(url)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data: {{e}}")
        return None

if __name__ == "__main__":
    data = fetch_data()
    if data:
        print("Data fetched successfully:")
        print(json.dumps(data, indent=2))
    else:
        print("Failed to fetch data")
'''

        # Write the content to the file
        with open(filename, 'w') as f:
            f.write(script_content)
            
        print(f"Script saved to {filename}")
        return filename
        
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

if __name__ == "__main__":
    # Example usage with a public API
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    saved_file = call_rest_api_and_save(api_url)
    if saved_file:
        print(f"Successfully created {saved_file}")