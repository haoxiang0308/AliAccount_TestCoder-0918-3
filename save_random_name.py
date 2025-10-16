import os
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def save_api_script_to_random_file():
    """Read the API script and save it to a randomly named file."""
    # Read the original API script
    with open('/workspace/api_script.py', 'r') as source_file:
        script_content = source_file.read()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    random_file_path = f'/workspace/{random_filename}'
    
    # Write the content to the new file
    with open(random_file_path, 'w') as dest_file:
        dest_file.write(script_content)
    
    print(f"API script saved to randomly named file: {random_filename}")
    return random_file_path

if __name__ == "__main__":
    save_api_script_to_random_file()