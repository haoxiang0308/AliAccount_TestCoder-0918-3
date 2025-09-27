import requests
import random
import string

# Example: Fetch a random fact from an API
url = "https://uselessfacts.jsph.pl/random.json?language=en"

try:
    response = requests.get(url)
    response.raise_for_status()  # Raise an exception for bad status codes

    data = response.json()
    fact = data.get('text', 'No fact found')

    print(f"Random Fact: {fact}")

    # Generate a random filename
    random_filename = "api_script_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"
    print(f"Saving script to: {random_filename}")

    # Save this script to the random filename
    with open(random_filename, 'w') as f:
        f.write('#!/usr/bin/env python3\n')
        f.write('# This script was generated dynamically.\n\n')
        f.write('import requests\n')
        f.write('import random\n')
        f.write('import string\n\n')
        f.write(f'url = "{url}"\n\n')
        f.write('try:\n')
        f.write('    response = requests.get(url)\n')
        f.write('    response.raise_for_status()\n\n')
        f.write('    data = response.json()\n')
        f.write("    fact = data.get('text', 'No fact found')\n\n")
        f.write("    print(f'Retrieved Data: {data}')\n")
        f.write("    print(f'Random Fact: {fact}')\n\n")
        f.write('except requests.exceptions.RequestException as e:\n')
        f.write("    print(f'An error occurred while fetching the API: {e}')\n")

    print(f"Script saved successfully to {random_filename}!")

except requests.exceptions.RequestException as e:
    print(f"An error occurred: {e}")
