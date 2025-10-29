import requests
import json
import random
import string

def call_rest_api():
    """
    Function to call a REST API using the requests library
    """
    # Using JSONPlaceholder as a sample API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make a GET request to the API
        response = requests.get(url)
        
        # Check if the request was successful
        if response.status_code == 200:
            print("API call successful!")
            print("Response data:")
            print(json.dumps(response.json(), indent=2))
            
            # Return the response data
            return response.json()
        else:
            print(f"API call failed with status code: {response.status_code}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while calling the API: {e}")
        return None

def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

if __name__ == "__main__":
    # Call the API
    api_data = call_rest_api()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    print(f"Saving this script to: {random_filename}")
    
    # Save this script to the randomly named file
    with open(__file__, 'r') as original_file:
        script_content = original_file.read()
    
    with open(random_filename, 'w') as new_file:
        new_file.write(script_content)
    
    print(f"Script successfully saved to {random_filename}")