import requests
import json
import random
import string

# Configuration
api_url = "https://jsonplaceholder.typicode.com/posts/1"  # Example API endpoint
output_directory = "/workspace"  # Directory to save the file

def generate_random_filename(length=8, prefix="api_script_", suffix=".py"):
    """Generates a random filename with a prefix and suffix."""
    random_chars = ''.join(random.choices(string.ascii_letters + string.digits, k=length))
    return f"{prefix}{random_chars}{suffix}"

def fetch_api_data(url):
    """Fetches data from the given API URL."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while fetching data: {e}")
        return None

def save_data_to_file(data, filepath):
    """Saves the fetched data to a Python file as a dictionary."""
    try:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write("# Fetched API Data\n")
            f.write("api_data = ")
            # Use json.dump with indent for pretty printing
            json.dump(data, f, indent=4)
            f.write("\n")
        print(f"Data successfully saved to {filepath}")
        return True
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")
        return False

if __name__ == "__main__":
    print("Fetching data from the API...")
    data = fetch_api_data(api_url)

    if data:
        random_filename = generate_random_filename()
        output_path = f"{output_directory}/{random_filename}"
        print(f"Saving data to {output_path}...")
        if save_data_to_file(data, output_path):
            print("Script execution completed successfully.")
        else:
            print("Script execution failed during the file writing phase.")
    else:
        print("Script execution failed during the API call phase.")
