import requests
import json

# Configuration
API_URL = "https://jsonplaceholder.typicode.com/posts/1"  # Example API
OUTPUT_FILE = "api_response.json"  # Temporary output name, will be renamed

def fetch_and_save_data():
    """Fetches data from the API and saves it to a JSON file."""
    try:
        response = requests.get(API_URL)
        response.raise_for_status()  # Raise an exception for bad status codes

        data = response.json()

        with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=4)

        print(f"Data successfully fetched and saved to {OUTPUT_FILE}")

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while fetching data: {e}")
    except json.JSONDecodeError:
        print("An error occurred while decoding the JSON response.")
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")

if __name__ == "__main__":
    fetch_and_save_data()