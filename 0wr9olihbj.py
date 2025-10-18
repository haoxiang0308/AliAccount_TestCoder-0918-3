import requests
import json
import random
import string

def call_rest_api():
    """
    Function to call a REST API and display the response
    """
    # Using JSONPlaceholder as a sample API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make a GET request to the API
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

def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

if __name__ == "__main__":
    # Call the API
    api_data = call_rest_api()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    print(f"\nSaving this script to: {random_filename}")
    
    # Read the current script content
    with open(__file__, 'r') as source_file:
        script_content = source_file.read()
    
    # Write the script content to the randomly named file
    with open(random_filename, 'w') as dest_file:
        dest_file.write(script_content)
    
    print(f"Script successfully saved to {random_filename}")