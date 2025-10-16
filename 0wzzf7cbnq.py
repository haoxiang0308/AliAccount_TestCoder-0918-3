import requests
import json

def call_api_and_save():
    """
    Calls a REST API and prints the response.
    """
    # Using JSONPlaceholder as a sample API
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make the GET request
        response = requests.get(api_url)
        
        # Check if the request was successful
        response.raise_for_status()
        
        # Parse the JSON response
        data = response.json()
        
        print("API Response:")
        print(json.dumps(data, indent=2))
        
        return data
        
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")
        return None

if __name__ == "__main__":
    call_api_and_save()