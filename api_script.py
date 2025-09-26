#!/usr/bin/env python3
"""
A Python script to call a REST API using the Requests library
and save the response to a file.
"""

import requests
import random
import string


def generate_random_filename(length=10, prefix="api_output_", suffix=".json"):
    """Generates a random filename."""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=length))
    return f"{prefix}{random_chars}{suffix}"


def call_api_and_save(url, output_filename):
    """Calls the API and saves the response."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes

        with open(output_filename, 'w', encoding='utf-8') as f:
            f.write(response.text)

        print(f"API response saved to {output_filename}")
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while calling the API: {e}")
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")


if __name__ == "__main__":
    API_URL = "https://jsonplaceholder.typicode.com/posts/1"  # Example API
    OUTPUT_FILE = generate_random_filename()

    call_api_and_save(API_URL, OUTPUT_FILE)
