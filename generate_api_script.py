import requests
import random
import string

# Configuration
API_URL = "https://jsonplaceholder.typicode.com/posts/1"  # Example API endpoint
OUTPUT_DIR = "/workspace"  # Directory to save the output file

def generate_random_filename(length=8, prefix="api_output_", suffix=".py"):
    """Generates a random filename with a prefix, random string, and suffix."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=length))
    return f"{prefix}{random_string}{suffix}"

def fetch_and_save_api_data(url, output_path):
    """Fetches data from a URL and saves it as a Python script."""
    try:
        print(f"Fetching data from: {url}")
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes

        # Prepare the content for the Python file
        file_content = f'''# Fetched API Data
# Source: {url}

api_response_data = {response.json()}

if __name__ == "__main__":
    print("Data fetched from API:")
    print(api_response_data)
'''
        with open(output_path, 'w', encoding='utf-8') as file:
            file.write(file_content)

        print(f"API data successfully saved to: {output_path}")

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while fetching the API: {e}")
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")

if __name__ == "__main__":
    random_filename = generate_random_filename()
    output_file_path = f"{OUTPUT_DIR}/{random_filename}"
    fetch_and_save_api_data(API_URL, output_file_path)
