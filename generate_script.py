import sqlite3
import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Python script content
script_content = '''import sqlite3

# Connect to SQLite database (or create it)
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

# Commit changes and close the connection
conn.commit()
print('Table \\'users\\' created successfully!')
conn.close()
'''

# Write the script content to the randomly named file
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Generated script: {random_filename}")