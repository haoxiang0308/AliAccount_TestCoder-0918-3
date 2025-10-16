#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API
and save the response to a file.
"""
import requests
import json
import random
import string

def call_rest_api(url):
    """
    Call a REST API and return the response
    """
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def main():
    # Example API - you can change this to any REST API endpoint
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print(f"Calling API: {api_url}")
    data = call_rest_api(api_url)
    
    if data:
        print("API call successful!")
        print(f"Data received: {json.dumps(data, indent=2)}")
        
        # Generate random filename
        random_filename = generate_random_filename()
        print(f"Saving script to randomly named file: {random_filename}")
        
        # Save this script to the randomly named file
        with open(__file__, 'r') as source_file:
            script_content = source_file.read()
        
        with open(random_filename, 'w') as dest_file:
            dest_file.write(script_content)
        
        print(f"Script saved to {random_filename}")
    else:
        print("Failed to retrieve data from API")

if __name__ == "__main__":
    main()