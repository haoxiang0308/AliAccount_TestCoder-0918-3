#!/usr/bin/env python3
"""
Auto-generated script to call REST API
"""

import requests
import json

def fetch_data():
    """Fetch data from the API endpoint"""
    url = "https://jsonplaceholder.typicode.com/posts/1"
    try:
        response = requests.get(url)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data: {e}")
        return None

if __name__ == "__main__":
    data = fetch_data()
    if data:
        print("Data fetched successfully:")
        print(json.dumps(data, indent=2))
    else:
        print("Failed to fetch data")
