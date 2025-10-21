#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API.
This script fetches data from a public API and displays the results.
"""

import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def fetch_api_data():
    """Fetch data from a public REST API."""
    # Using JSONPlaceholder as a demo API
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        response = requests.get(api_url)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        print(f"Status Code: {response.status_code}")
        print(f"Response Headers: {dict(response.headers)}")
        print(f"Response Data: {json.dumps(response.json(), indent=2)}")
        
        return response.json()
    
    except requests.exceptions.RequestException as e:
        print(f"Error making API request: {e}")
        return None

def save_script_copy():
    """Save a copy of this script with a random filename."""
    random_filename = generate_random_filename()
    
    # Read the current script content
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Write to the new random filename
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    print("Fetching data from REST API...")
    data = fetch_api_data()
    
    if data:
        print("\nSaving script copy with random filename...")
        saved_filename = save_script_copy()
        print(f"Successfully saved script as: {saved_filename}")
    else:
        print("Failed to fetch API data.")