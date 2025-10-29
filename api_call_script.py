#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API
and save the response to a file with a random name.
"""

import requests
import random
import string
import json

def generate_random_filename(extension=".py"):
    """Generate a random filename with the specified extension."""
    letters = string.ascii_lowercase + string.digits
    random_part = ''.join(random.choice(letters) for _ in range(10))
    return f"{random_part}{extension}"

def call_rest_api(url):
    """Call a REST API and return the response."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        return response.json()  # Assuming the API returns JSON
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

def save_data_to_random_file(data, extension=".py"):
    """Save data to a file with a randomly generated name."""
    random_filename = generate_random_filename(extension)
    
    with open(random_filename, 'w', encoding='utf-8') as file:
        if isinstance(data, dict) or isinstance(data, list):
            # If data is JSON, pretty-print it
            json.dump(data, file, indent=2)
        else:
            # Otherwise, just write as string
            file.write(str(data))
    
    print(f"Data saved to: {random_filename}")
    return random_filename

def main():
    # Example API call - using JSONPlaceholder API for demonstration
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print(f"Calling API: {api_url}")
    api_data = call_rest_api(api_url)
    
    if api_data:
        # Save the API response to a randomly named .py file
        saved_filename = save_data_to_random_file(api_data, ".py")
        print(f"Successfully saved API response to {saved_filename}")
    else:
        print("Failed to retrieve data from the API")

if __name__ == "__main__":
    main()