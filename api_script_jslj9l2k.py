#!/usr/bin/env python3
# This script was generated dynamically.

import requests
import random
import string

url = "https://uselessfacts.jsph.pl/random.json?language=en"

try:
    response = requests.get(url)
    response.raise_for_status()

    data = response.json()
    fact = data.get('text', 'No fact found')

    print(f'Retrieved Data: {data}')
    print(f'Random Fact: {fact}')

except requests.exceptions.RequestException as e:
    print(f'An error occurred while fetching the API: {e}')
