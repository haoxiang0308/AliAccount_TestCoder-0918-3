import requests
import json

# Configuration
API_URL = "https://jsonplaceholder.typicode.com/posts/1"  # Example API endpoint
OUTPUT_FILE = "api_response.json"  # File to save the response

def fetch_and_save_data():
    """
    Fetches data from the API and saves it to a JSON file.
    """
    try:
        print(f"Fetching data from {API_URL}...")
        response = requests.get(API_URL)
        response.raise_for_status()  # Raises an HTTPError for bad responses

        data = response.json()
        print("Data fetched successfully.")

        print(f"Saving data to {OUTPUT_FILE}...")
        with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=2)
        print("Data saved successfully.")

    except requests.exceptions.HTTPError as http_err:
        print(f"HTTP error occurred: {http_err}")
    except requests.exceptions.RequestException as req_err:
        print(f"An error occurred during the request: {req_err}")
    except json.JSONDecodeError as json_err:
        print(f"Error decoding JSON response: {json_err}")
    except Exception as err:
        print(f"An unexpected error occurred: {err}")

if __name__ == "__main__":
    fetch_and_save_data()
