import os
import random
import string
import requests

def generate_random_filename(ext='.py'):
    """Generates a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_name}{ext}"

def create_api_script(filename, api_url):
    """Creates a Python script that calls a REST API and saves the response."""
    script_content = f'''import requests

def main():
    url = "{api_url}"
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        print("API call successful!")
        print("Response:")
        print(response.text)
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {{e}}")

if __name__ == "__main__":
    main()
'''
    with open(filename, 'w') as f:
        f.write(script_content)
    print(f"Script created: {{filename}}")

if __name__ == "__main__":
    api_url = "https://jsonplaceholder.typicode.com/posts/1"  # Example API
    random_filename = generate_random_filename()
    create_api_script(random_filename, api_url)
