import random
import string

# Generate a random filename
filename = 'hello_script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'
print(f"Generated filename: {filename}")

# Content of the new Python script
script_content = """def hello_world():
    print('Привет, мир!')

# Call the function
hello_world()
"""

# Write the content to the new file
with open(filename, 'w') as f:
    f.write(script_content)

print(f"Script '{filename}' has been created.")