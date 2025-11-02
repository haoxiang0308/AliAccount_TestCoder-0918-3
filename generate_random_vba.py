import os
import random
import string
import shutil

def generate_random_vba_filename():
    """Generate a random .vba filename"""
    # Generate a random string of 10 characters
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.vba"

def main():
    # Read the VBA macro from the existing file
    with open('/workspace/format_excel_macro.bas', 'r') as source_file:
        vba_code = source_file.read()
    
    # Generate a random filename with .vba extension
    random_filename = generate_random_vba_filename()
    random_filepath = f'/workspace/{random_filename}'
    
    # Write the VBA code to the randomly named file
    with open(random_filepath, 'w') as dest_file:
        dest_file.write(vba_code)
    
    print(f"VBA macro saved to randomly named file: {random_filepath}")
    print(f"File content:\n{vba_code}")

if __name__ == "__main__":
    main()