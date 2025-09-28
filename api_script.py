import requests
import random
import string

# Configuration
API_URL = "https://jsonplaceholder.typicode.com/posts/1"  # Example API
OUTPUT_DIR = "/workspace"

# Generate a random filename
random_filename = "".join(random.choices(string.ascii_letters + string.digits, k=10)) + ".py"
output_path = f"{OUTPUT_DIR}/{random_filename}"

# Make the API call
try:
    response = requests.get(API_URL)
    response.raise_for_status()  # Raise an exception for bad status codes

    # Get the response data
    api_data = response.json()

    # Write the data to the randomly named file
    with open(output_path, 'w') as f:
        f.write(f"# Data retrieved from {API_URL}\n")
        f.write("import json\n\n")
        f.write("data = ")
        f.write(repr(api_data))
        f.write("\n\n# Example of how to use the data\n")
        f.write("print('Data saved from API:')\n")
        f.write("print(json.dumps(data, indent=2))\n")

    print(f"API call successful. Data saved to {output_path}")

except requests.exceptions.RequestException as e:
    print(f"An error occurred while calling the API: {e}")
except IOError as e:
    print(f"An error occurred while writing the file: {e}")
