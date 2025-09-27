import sqlite3
import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Python script content to create a SQLite table
script_content = f"""import sqlite3

# Connect to SQLite database (or create it if it doesn't exist)
conn = sqlite3.connect('example.db')
cursor = conn.cursor()

# Create a table
create_table_query = \"\"\"
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    age INTEGER
);
\"\"\"

cursor.execute(create_table_query)

# Commit the changes and close the connection
conn.commit()
conn.close()

print('Table \\'users\\' created successfully.')
"""

# Write the script content to the randomly named file
with open(random_filename, 'w') as f:
    f.write(script_content)

print(random_filename)