import requests
import json
import random
import string

def generate_random_filename():
    """Generates a random filename with a .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def fetch_and_save_api_data(url, output_filename):
    """Fetches data from a REST API and saves it to a file."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes

        data = response.json()

        with open(output_filename, 'w', encoding='utf-8') as f:
            f.write(f"# Data fetched from {url}\n")
            f.write(f"# Saved at {output_filename}\n\n")
            json.dump(data, f, indent=4)

        print(f"Data successfully fetched and saved to {output_filename}")

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while fetching data: {e}")
    except json.JSONDecodeError:
        print("Failed to decode JSON response.")
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")

if __name__ == "__main__":
    # Example API endpoint (JSONPlaceholder)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    filename = generate_random_filename()
    fetch_and_save_api_data(api_url, filename)
