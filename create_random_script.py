#!/usr/bin/env python3
"""
Script to save the PyMongo insert script to a randomly named .py file
"""

import random
import string
import os


def generate_random_filename():
    """Generate a random Python filename"""
    random_part = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"pymongo_script_{random_part}.py"


def main():
    # Read the original PyMongo script
    with open('/workspace/pymongo_insert_script.py', 'r') as original_file:
        script_content = original_file.read()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    random_file_path = f'/workspace/{random_filename}'
    
    # Write the content to the new random filename
    with open(random_file_path, 'w') as random_file:
        random_file.write(script_content)
    
    print(f"PyMongo script saved to randomly named file: {random_filename}")
    print(f"Full path: {random_file_path}")


if __name__ == "__main__":
    main()