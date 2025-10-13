
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
        print("\nResponse saved to api_response.json")

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while calling the API: {e}")
    except json.JSONDecodeError:
        print("Failed to decode JSON response.")

if __name__ == "__main__":
    call_api_and_save()
