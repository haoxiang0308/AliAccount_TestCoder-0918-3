import requests

def fetch_data():
    # Example API call
    url = "https://jsonplaceholder.typicode.com/posts/1"
    response = requests.get(url)
    if response.status_code == 200:
        print(response.json())
    else:
        print(f"Error: {{response.status_code}}")

if __name__ == "__main__":
    fetch_data()
