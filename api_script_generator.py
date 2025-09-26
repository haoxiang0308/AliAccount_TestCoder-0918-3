import requests
import random
import string

def generate_random_filename(length=10):
    """Generates a random filename with a .py extension."""
    letters = string.ascii_lowercase
    random_part = ''.join(random.choice(letters) for i in range(length))
    return f"{random_part}.py"

def create_api_script(url, output_filename):
    """Creates a Python script that calls a REST API and saves the response."""
    script_content = f'''import requests

def main():
    url = "{url}"
    response = requests.get(url)

    if response.status_code == 200:
        print("Success!")
        print("Response Data:")
        print(response.json()) # Assuming JSON response
        # You can save the data to a file here if needed
        # with open("api_response.json", "w") as f:
        #     f.write(response.text)
    else:
        print(f"Error: Received status code {{response.status_code}}")
        print(response.text)

if __name__ == "__main__":
    main()
'''
    with open(output_filename, 'w') as f:
        f.write(script_content)
    print(f"Script created: {{output_filename}}")

if __name__ == "__main__":
    # Example API URL, replace with your desired API
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    filename = generate_random_filename()
    create_api_script(api_url, filename)
