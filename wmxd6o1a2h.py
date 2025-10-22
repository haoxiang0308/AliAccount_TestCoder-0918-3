import requests
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
