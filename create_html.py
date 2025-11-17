import random
import string

# Generate a random filename
filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.html'
print(f'Creating file: {filename}')

# HTML content
content = '''<!DOCTYPE html>
<html>
<head>
    <title>Hello World Page</title>
</head>
<body>
    <h1>Hello, World!</h1>
</body>
</html>'''

# Write the content to the file
with open(filename, 'w') as f:
    f.write(content)

print(f'File {filename} created successfully')