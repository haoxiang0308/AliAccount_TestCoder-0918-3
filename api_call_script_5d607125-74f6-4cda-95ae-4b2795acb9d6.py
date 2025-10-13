import requests
import json

def call_api_and_save():
    # Example API call (JSONPlaceholder)
    url = "https://jsonplaceholder.typicode.com/posts/1"
    response = requests.get(url)

    if response.status_code == 200:
        data = response.json()
        print("API call successful!")
        print(json.dumps(data, indent=2))
        # Optionally, save the data to a file
        # with open("api_response.json", "w") as f:
        #     json.dump(data, f, indent=2)
    else:
        print(f"API call failed with status code: {response.status_code}")

if __name__ == "__main__":
    call_api_and_save()
