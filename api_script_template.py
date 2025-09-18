import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for _ in range(10))
    return random_name + ".py"

def call_rest_api(url):
    """Call a REST API and return the response"""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

def save_script_to_file(filename):
    """Save a sample REST API calling script to a file"""
    script_content = '''
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
'''

    with open(filename, 'w') as file:
        file.write(script_content)
    
    print(f"Script saved to {filename}")

if __name__ == "__main__":
    # Generate a random filename
    filename = generate_random_filename()
    
    # Save the script to the randomly named file
    save_script_to_file(filename)
    
    # Example of using the saved script
    print(f"\\nExample of what the saved script does:")
    print(f"Calling REST API...")
    api_data = call_rest_api("https://jsonplaceholder.typicode.com/posts/1")
    if api_data:
        print("API Response:")
        print(json.dumps(api_data, indent=2))