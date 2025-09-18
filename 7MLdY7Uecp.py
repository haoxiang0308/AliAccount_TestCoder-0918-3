#!/usr/bin/env python3
"""
REST API Client Script
This script demonstrates how to use the Requests library to call a REST API.
"""

import requests
import json


def call_rest_api(url, method='GET', data=None, headers=None):
    """
    Call a REST API endpoint with the specified parameters.
    
    Args:
        url (str): The API endpoint URL
        method (str): HTTP method (GET, POST, PUT, DELETE)
        data (dict): Data to send with the request
        headers (dict): HTTP headers to include
        
    Returns:
        dict: The JSON response from the API
    """
    if headers is None:
        headers = {'Content-Type': 'application/json'}
        
    try:
        if method.upper() == 'GET':
            response = requests.get(url, headers=headers)
        elif method.upper() == 'POST':
            response = requests.post(url, headers=headers, json=data)
        elif method.upper() == 'PUT':
            response = requests.put(url, headers=headers, json=data)
        elif method.upper() == 'DELETE':
            response = requests.delete(url, headers=headers)
        else:
            raise ValueError(f"Unsupported HTTP method: {method}")
            
        # Raise an exception for bad status codes
        response.raise_for_status()
        
        # Try to return JSON response, fallback to text
        try:
            return response.json()
        except json.JSONDecodeError:
            return {"text": response.text}
            
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None


def main():
    """Main function demonstrating API calls."""
    # Example 1: GET request to a public API
    print("Example 1: GET request to JSONPlaceholder API")
    url = "https://jsonplaceholder.typicode.com/posts/1"
    result = call_rest_api(url, 'GET')
    
    if result:
        print(f"Response: {json.dumps(result, indent=2)}")
    else:
        print("Failed to get response")
    
    print("\n" + "="*50 + "\n")
    
    # Example 2: POST request to a public API
    print("Example 2: POST request to JSONPlaceholder API")
    url = "https://jsonplaceholder.typicode.com/posts"
    post_data = {
        "title": "Test Post",
        "body": "This is a test post created by the script",
        "userId": 1
    }
    
    result = call_rest_api(url, 'POST', post_data)
    
    if result:
        print(f"Response: {json.dumps(result, indent=2)}")
    else:
        print("Failed to get response")


if __name__ == "__main__":
    main()