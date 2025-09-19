import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"api_script_{random_chars}.py"

def call_rest_api(url):
    """Call a REST API and return the response"""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

def main():
    # Using JSONPlaceholder API for demonstration
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print(f"Calling REST API: {api_url}")
    data = call_rest_api(api_url)
    
    if data:
        print("API Response:")
        print(json.dumps(data, indent=2))
        
        # Save the response to a file
        filename = generate_random_filename()
        with open(filename, 'w') as f:
            f.write("# API Response Data\n")
            f.write(f"data = {json.dumps(data, indent=2)}\n")
        
        print(f"\nData saved to {filename}")
    else:
        print("Failed to retrieve data from API")

if __name__ == "__main__":
    main()