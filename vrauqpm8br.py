import requests
import json

# Configuration
API_URL = "https://jsonplaceholder.typicode.com/posts/1"  # Example API endpoint
OUTPUT_FILE = "api_response.json"  # File to save the response

def fetch_and_save_data():
    """Makes a GET request to the API and saves the response."""
    try:
        print(f"Fetching data from {API_URL}...")
        response = requests.get(API_URL)
        response.raise_for_status()  # Raises an HTTPError for bad responses

        data = response.json()
        print("Data fetched successfully. Saving...")

        with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=4)

        print(f"Data saved to {OUTPUT_FILE}")

    except requests.exceptions.RequestException as e:
        print(f"An error occurred during the API request: {e}")
    except json.JSONDecodeError:
        print("Failed to decode the JSON response.")
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")

if __name__ == "__main__":
    fetch_and_save_data()
