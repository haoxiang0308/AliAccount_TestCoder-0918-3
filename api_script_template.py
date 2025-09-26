import requests
import json
import os
import uuid

def call_api_and_save_response(url, output_dir="./api_responses"):
    """
    Calls a REST API and saves the response to a randomly named JSON file.

    Args:
        url (str): The URL of the REST API endpoint to call.
        output_dir (str): The directory to save the response file. Defaults to './api_responses'.

    Returns:
        str: The path of the file where the response was saved, or None on failure.
    """
    try:
        # Make the API call
        print(f"Making GET request to: {url}")
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes (4xx or 5xx)

        # Ensure the output directory exists
        os.makedirs(output_dir, exist_ok=True)

        # Generate a unique filename using uuid
        unique_filename = f"api_response_{uuid.uuid4().hex}.json"
        output_path = os.path.join(output_dir, unique_filename)

        # Write the response data to the file
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(response.json(), f, indent=4)

        print(f"API response successfully saved to: {output_path}")
        return output_path

    except requests.exceptions.RequestException as e:
        print(f"An error occurred during the API request: {e}")
        return None
    except json.JSONDecodeError:
        print("The API response was not valid JSON.")
        return None
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return None

if __name__ == "__main__":
    # Example API endpoint (a public test API)
    API_URL = "https://jsonplaceholder.typicode.com/posts/1"
    
    saved_file_path = call_api_and_save_response(API_URL)
    if saved_file_path:
        print(f"Script completed. Data saved to {saved_file_path}")
    else:
        print("Script failed to save API data.")