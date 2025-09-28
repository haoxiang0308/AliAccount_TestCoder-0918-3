import requests
import json
import os

def fetch_and_save_data(url, output_filename):
  """
  Fetches data from a REST API and saves it to a file.

  Args:
    url: The URL of the REST API endpoint.
    output_filename: The name of the file to save the data to.
  """
  try:
    response = requests.get(url)
    response.raise_for_status()  # Raise an exception for bad status codes (4xx or 5xx)

    data = response.json()

    with open(output_filename, 'w', encoding='utf-8') as f:
      json.dump(data, f, indent=2)

    print(f"Data successfully fetched from {url} and saved to {output_filename}")

  except requests.exceptions.RequestException as e:
    print(f"An error occurred while fetching data: {e}")
  except json.JSONDecodeError:
    print("Error: The response was not valid JSON.")
  except IOError as e:
    print(f"An error occurred while writing the file: {e}")

if __name__ == "__main__":
  # Example API endpoint (JSONPlaceholder)
  API_URL = "https://jsonplaceholder.typicode.com/posts/1"
  OUTPUT_FILE = "api_data.json"

  fetch_and_save_data(API_URL, OUTPUT_FILE)