#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API
and displays the response.
"""

import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def call_rest_api():
    """
    Call a REST API and return the response.
    Using JSONPlaceholder API as an example.
    """
    try:
        # Using a public test API
        url = "https://jsonplaceholder.typicode.com/posts/1"
        response = requests.get(url)
        
        # Raise an exception for bad status codes
        response.raise_for_status()
        
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error making API request: {e}")
        return None

def save_to_random_file(content):
    """Save content to a randomly named .py file."""
    random_filename = generate_random_filename()
    
    with open(random_filename, 'w') as file:
        file.write(f'"""\nAPI Response Data\n"""\n\n')
        file.write(f'api_response = {repr(content)}\n')
    
    print(f"Data saved to {random_filename}")
    return random_filename

def main():
    print("Calling REST API...")
    api_data = call_rest_api()
    
    if api_data:
        print("API call successful!")
        print("Sample data:", json.dumps(api_data, indent=2)[:200] + "...")
        
        # Save the API response to a randomly named .py file
        random_file = save_to_random_file(api_data)
        print(f"API response saved to {random_file}")

if __name__ == "__main__":
    main()