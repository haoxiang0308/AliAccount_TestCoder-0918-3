import os
import random
import string
import shutil

def generate_random_vba_file():
    # Read the VBA macro template
    with open('format_macro_template.vba', 'r') as f:
        vba_content = f.read()
    
    # Generate a random filename with .vba extension
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    random_filename = f"{random_name}.vba"
    
    # Write the VBA content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(vba_content)
    
    print(f"VBA macro saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    generate_random_vba_file()