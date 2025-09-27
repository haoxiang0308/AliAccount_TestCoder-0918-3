import requests
import json
import os

# Configuration
API_URL = "https://jsonplaceholder.typicode.com/posts/1"  # Example API
OUTPUT_FILE = "api_response.json"

def fetch_and_save_data():
    """Fetches data from the API and saves it to a JSON file."""
    try:
        print(f"Fetching data from {API_URL}...")
        response = requests.get(API_URL)
        response.raise_for_status()  # Raise an exception for bad status codes

        data = response.json()
        print(f"Data fetched successfully. Saving to {OUTPUT_FILE}...")

        with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=4)

        print("Data saved successfully!")

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while fetching data: {e}")
    except json.JSONDecodeError:
        print("An error occurred while decoding the JSON response.")
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")

if __name__ == "__main__":
    fetch_and_save_data()
