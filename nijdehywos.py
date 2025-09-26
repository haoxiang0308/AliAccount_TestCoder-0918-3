import requests

def main():
    url = "https://jsonplaceholder.typicode.com/posts/1"
    response = requests.get(url)

    if response.status_code == 200:
        print("Success!")
        print("Response Data:")
        print(response.json()) # Assuming JSON response
        # You can save the data to a file here if needed
        # with open("api_response.json", "w") as f:
        #     f.write(response.text)
    else:
        print(f"Error: Received status code {response.status_code}")
        print(response.text)

if __name__ == "__main__":
    main()
