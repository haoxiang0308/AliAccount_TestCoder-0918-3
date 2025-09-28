import sqlite3

# Connect to a new SQLite database (or create it if it doesn't exist)
conn = sqlite3.connect('example.db')
cursor = conn.cursor()

# Create a new table
cursor.execute('''
CREATE TABLE IF NOT EXISTS employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER,
    department TEXT
)
''')

# Commit the changes and close the connection
conn.commit()
conn.close()

print("SQLite table 'employees' created successfully.")