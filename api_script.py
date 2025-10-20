import requests
import random
import string

def call_api_and_save():
    # Call a public REST API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Generate a random filename
        random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
        filename = f"{random_name}.py"
        
        # Save the API response to the randomly named .py file
        with open(filename, 'w', encoding='utf-8') as file:
            file.write(f"# API Response saved from {url}\n")
            file.write(f"data = {repr(response.json())}\n")
        
        print(f"API response saved to {filename}")
        return filename
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

if __name__ == "__main__":
    call_api_and_save()