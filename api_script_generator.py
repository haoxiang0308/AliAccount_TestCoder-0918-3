import os
import random
import string

# The Python script content that uses the requests library to call a REST API
script_content = '''
import requests
import json

def call_api_and_save():
    # Example API endpoint (JSONPlaceholder)
    url = "https://jsonplaceholder.typicode.com/posts/1"

    try:
        # Make a GET request
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes

        # Parse the JSON response
        data = response.json()

        # Print the data
        print("API Response:")
        print(json.dumps(data, indent=2))

        # Save the response to a file
        with open("api_response.json", "w") as f:
            json.dump(data, f, indent=2)
        print("\\nResponse saved to api_response.json")

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while calling the API: {e}")
    except json.JSONDecodeError:
        print("Failed to decode JSON response.")

if __name__ == "__main__":
    call_api_and_save()
'''

# Generate a random filename
random_filename = "script_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"

# Write the script content to the randomly named file
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Python script created: {random_filename}")
