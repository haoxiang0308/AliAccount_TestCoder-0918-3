import random
import string
import os

def generate_random_vba():
    # Read the content of the original VBA file
    with open('/workspace/format_excel_macro.vba', 'r') as f:
        vba_content = f.read()
    
    # Generate a random filename with .vba extension
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.vba'
    random_path = os.path.join('/workspace', random_name)
    
    # Write the content to the new randomly named file
    with open(random_path, 'w') as f:
        f.write(vba_content)
    
    print(f"VBA macro saved to randomly named file: {random_path}")
    return random_path

if __name__ == "__main__":
    generate_random_vba()