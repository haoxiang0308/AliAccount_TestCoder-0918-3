import os
import random
import string

# Read the original VBA code
with open('/workspace/VBA_fill_cells.bas', 'r') as file:
    vba_code = file.read()

# Generate a random name for the VBA file
def generate_random_filename():
    # Create a random string of 10 characters (letters and digits)
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_string}.vba"

# Generate random filename
random_filename = generate_random_filename()
random_filepath = f"/workspace/{random_filename}"

# Write the VBA code to the randomly named file
with open(random_filepath, 'w') as file:
    file.write(vba_code)

print(f"VBA code saved to: {random_filepath}")
print(f"Random filename: {random_filename}")