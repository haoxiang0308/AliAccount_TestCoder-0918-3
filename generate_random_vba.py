import os
import random
import string
from datetime import datetime

def generate_random_vba_filename():
    """Generate a random .vba filename"""
    # Create a random name with timestamp for uniqueness
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"macro_{random_string}_{timestamp}.vba"

def copy_macro_to_random_vba():
    """Copy the existing macro to a randomly named .vba file"""
    source_file = "format_excel_sheet.bas"
    random_filename = generate_random_vba_filename()
    
    # Read the source macro file
    with open(source_file, 'r') as src:
        macro_content = src.read()
    
    # Write to the new randomly named .vba file
    with open(random_filename, 'w') as dest:
        dest.write(macro_content)
    
    print(f"VBA macro saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    if os.path.exists("format_excel_sheet.bas"):
        random_vba_file = copy_macro_to_random_vba()
        print(f"Successfully created: {random_vba_file}")
    else:
        print("Source macro file not found!")