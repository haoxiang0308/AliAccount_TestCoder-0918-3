
import requests
import json

def call_rest_api(url):
    """Call a REST API and return the response"""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

# Example usage
if __name__ == "__main__":
    # Calling a sample REST API (JSONPlaceholder)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    data = call_rest_api(api_url)
    
    if data:
        print("API Response:")
        print(json.dumps(data, indent=2))
