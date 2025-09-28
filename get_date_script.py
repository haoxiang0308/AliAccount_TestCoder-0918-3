import random
import string

# Generate a random filename with .ps1 extension
random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
ps1_filename = f"{random_name}.ps1"

# PowerShell script content
script_content = "Get-Date\\n"

# Write the script content to the file
with open(ps1_filename, 'w') as f:
    f.write(script_content)

print(f"Created PowerShell script: {ps1_filename}")