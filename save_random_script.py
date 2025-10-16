import random
import string
import os

def generate_random_script_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Read the content of the main script
with open('main_script.py', 'r') as f:
    script_content = f.read()

# Generate a random filename for the Python script
random_script_filename = generate_random_script_filename()

# Save the script content to the new file with random name
with open(random_script_filename, 'w') as f:
    f.write(script_content)

print(f"Python script saved with random name: {random_script_filename}")