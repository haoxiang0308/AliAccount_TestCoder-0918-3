import os
import random
import string
from datetime import datetime

def generate_random_vba_filename():
    """Generate a random .vba filename"""
    # Create a random string of 10 characters
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    return f"macro_{random_string}_{timestamp}.vba"

def copy_vba_macro():
    """Copy the existing VBA macro to a randomly named file"""
    source_file = "/workspace/format_excel_macro.vba"
    
    # Check if source file exists
    if not os.path.exists(source_file):
        print(f"Source file {source_file} does not exist!")
        return
    
    # Generate random filename
    random_filename = generate_random_vba_filename()
    random_filepath = f"/workspace/{random_filename}"
    
    # Read the source file and write to the new random file
    with open(source_file, 'r') as src:
        content = src.read()
    
    with open(random_filepath, 'w') as dest:
        dest.write(content)
    
    print(f"VBA macro copied to randomly named file: {random_filepath}")
    return random_filepath

if __name__ == "__main__":
    copy_vba_macro()