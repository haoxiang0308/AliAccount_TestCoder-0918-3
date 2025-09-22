import requests
import json
import random
import string

def generate_random_string(length=8):
    """Generate a random string of fixed length"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def call_rest_api(url):
    """Call a REST API and return the response"""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

def save_to_file(data, filename):
    """Save data to a Python file"""
    with open(filename, 'w') as f:
        f.write("# REST API Response Data\n")
        f.write("import json\n\n")
        f.write(f"data = {json.dumps(data, indent=2)}\n\n")
        f.write("print(json.dumps(data, indent=2))\n")

def main():
    # Example API endpoint (JSONPlaceholder is a free testing API)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print(f"Calling REST API: {api_url}")
    data = call_rest_api(api_url)
    
    if data:
        # Generate a random filename
        random_filename = f"api_response_{generate_random_string()}.py"
        print(f"Saving response to: {random_filename}")
        save_to_file(data, random_filename)
        print("Done!")
    else:
        print("Failed to retrieve data from API")

if __name__ == "__main__":
    main()