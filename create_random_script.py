import os
import random
import string
import shutil

def generate_random_filename():
    """Generate a random Python filename"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def create_random_api_script():
    """Create a copy of the API script with a random name"""
    # Source file
    source_file = "/workspace/api_script_template.py"
    
    # Generate random filename
    random_filename = generate_random_filename()
    destination_file = f"/workspace/{random_filename}"
    
    # Copy the file
    shutil.copy(source_file, destination_file)
    
    print(f"Created API script with random name: {random_filename}")
    return destination_file

if __name__ == "__main__":
    create_random_api_script()