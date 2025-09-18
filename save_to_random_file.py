import random
import string
import os
import shutil

def generate_random_filename(length=10):
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for _ in range(length))
    return f"{random_name}.py"

def main():
    # Source script file
    source_file = "/workspace/mongo_insert_script.py"
    
    # Generate random filename
    random_filename = generate_random_filename()
    destination_file = f"/workspace/{random_filename}"
    
    # Copy the script to the new randomly named file
    shutil.copy(source_file, destination_file)
    
    print(f"Script copied to: {destination_file}")
    
    # Display the content of the new file
    print("\nContent of the new file:")
    with open(destination_file, 'r') as f:
        content = f.read()
        print(content)

if __name__ == "__main__":
    main()