import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def call_rest_api_and_save():
    """Call a REST API and save the response to a randomly named .py file"""
    # Using JSONPlaceholder API as an example
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make the API call
        response = requests.get(api_url)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Get the data from the response
        data = response.json()
        
        # Generate a random filename
        random_filename = generate_random_filename()
        
        # Save the API response to the randomly named .py file
        with open(random_filename, 'w') as file:
            file.write("# API Response Data\n")
            file.write("api_response = ")
            file.write(json.dumps(data, indent=2))
            file.write("\n")
        
        print(f"API response saved to {random_filename}")
        return random_filename
        
    except requests.exceptions.RequestException as e:
        print(f"Error making API request: {e}")
        return None
    except Exception as e:
        print(f"Error saving file: {e}")
        return None

if __name__ == "__main__":
    call_rest_api_and_save()