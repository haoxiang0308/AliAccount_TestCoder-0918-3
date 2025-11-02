import random
import string
import os

def generate_random_filename(extension=".vba"):
    """Generate a random filename with the specified extension."""
    # Generate a random string of 10 characters (letters and digits)
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_string}{extension}"

def copy_macro_to_random_vba():
    """Copy the macro from the source file to a randomly named .vba file."""
    source_file = "/workspace/format_excel_macro.vba"
    
    # Read the content of the source macro file
    with open(source_file, 'r') as file:
        macro_content = file.read()
    
    # Generate a random filename
    random_filename = generate_random_filename(".vba")
    random_filepath = f"/workspace/{random_filename}"
    
    # Write the macro content to the new randomly named file
    with open(random_filepath, 'w') as file:
        file.write(macro_content)
    
    print(f"VBA macro saved to randomly named file: {random_filepath}")
    return random_filepath

if __name__ == "__main__":
    random_file_path = copy_macro_to_random_vba()
    print(f"Successfully created: {random_file_path}")