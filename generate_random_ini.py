import os
import random
import string
import shutil

def generate_random_ini_filename():
    """Generate a random .ini filename"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"db_config_{random_string}.ini"

# Generate a random filename
random_filename = generate_random_ini_filename()
random_filepath = os.path.join("/workspace", random_filename)

# Copy the database config to the random filename
shutil.copy("/workspace/database_config.ini", random_filepath)

print(f"Database configuration saved to: {random_filepath}")