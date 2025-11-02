import requests
import json
import random
import string

def call_rest_api():
    """
    Function to call a REST API and display the response
    """
    # Using JSONPlaceholder API for demonstration
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make a GET request to the API
        response = requests.get(url)
        
        # Check if the request was successful
        if response.status_code == 200:
            print("API call successful!")
            print("Response data:")
            print(json.dumps(response.json(), indent=2))
            return response.json()
        else:
            print(f"API call failed with status code: {response.status_code}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while making the API call: {e}")
        return None

def save_script_to_random_file():
    """
    Function that saves this script to a randomly named .py file
    """
    # Generate a random filename
    random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    
    # Read the current script content
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    # Call the API
    api_data = call_rest_api()
    
    # Save this script to a randomly named file
    random_file = save_script_to_random_file()