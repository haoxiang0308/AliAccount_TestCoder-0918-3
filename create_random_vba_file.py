import os
import random
import string
import shutil

def generate_random_filename(extension=".vba"):
    """Generate a random filename with the specified extension."""
    # Create a random name with 10 random characters
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_name}{extension}"

def copy_macro_to_random_vba():
    """Copy the macro to a randomly named .vba file."""
    # Source file
    source_file = "/workspace/format_excel_macro.bas"
    
    # Check if source file exists
    if not os.path.exists(source_file):
        print(f"Source file {source_file} does not exist!")
        return
    
    # Generate random filename
    random_filename = generate_random_filename(".vba")
    destination_file = f"/workspace/{random_filename}"
    
    # Copy the file
    shutil.copy2(source_file, destination_file)
    
    print(f"Macro saved to randomly named file: {destination_file}")
    return destination_file

if __name__ == "__main__":
    copy_macro_to_random_vba()