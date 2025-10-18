import os
import random
import string
import shutil

def generate_random_toml_filename():
    """Generate a random .toml filename"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.toml"

# Generate a random filename
random_filename = generate_random_toml_filename()
random_filepath = os.path.join("/workspace", random_filename)

# Copy the existing config to the new random filename
shutil.copy("/workspace/app_config.toml", random_filepath)

print(f"Created TOML configuration file with random name: {random_filename}")