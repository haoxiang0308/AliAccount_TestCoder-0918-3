import requests

def main():
    url = "https://jsonplaceholder.typicode.com/posts/1"
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        print("API call successful!")
        print("Response:")
        print(response.text)
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()
