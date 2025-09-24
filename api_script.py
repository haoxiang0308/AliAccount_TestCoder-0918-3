#!/usr/bin/env python3
"""
A Python script to call a REST API using the Requests library.
This script fetches data from a public API and prints the response.
"""

import requests
import json
import random
import string

def generate_random_filename():
    """Generates a random filename with a .py extension."""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_string}.py"

def main():
    # Example: Using JSONPlaceholder, a free testing API
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    print(f"Fetching data from {api_url}...")

    try:
        response = requests.get(api_url)
        response.raise_for_status()  # Raises an HTTPError for bad responses

        data = response.json()
        print("Data fetched successfully:")
        print(json.dumps(data, indent=2))

        # Generate a random filename
        random_filename = generate_random_filename()
        print(f"\nSaving response data to a new file: {random_filename}")

        # Save the fetched data to the randomly named file
        with open(random_filename, 'w') as file:
            file.write("# Fetched data from REST API\n")
            file.write("data = ")
            file.write(json.dumps(data, indent=2))
            file.write("\n")
        
        print(f"Data successfully saved to {random_filename}")

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while making the API request: {e}")
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")

if __name__ == "__main__":
    main()