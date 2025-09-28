import sqlite3
import random
import string

# Generate a random filename
random_filename = 'script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Python script content
script_content = '''import sqlite3

# Connect to SQLite database (it will be created if it doesn't exist)
conn = sqlite3.connect('example.db')
cursor = conn.cursor()

# Create a table
cursor.execute("""
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    age INTEGER
)
""")

# Commit the changes and close the connection
conn.commit()
print('Table \\'users\\' created successfully!')
conn.close()
'''

# Write the script content to the randomly named file
with open(random_filename, 'w') as file:
    file.write(script_content)

print(f"Generated script saved as: {random_filename}")