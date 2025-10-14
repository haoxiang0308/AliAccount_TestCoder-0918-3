import sqlite3
import random
import string

# Generate a random table name
table_name = 'table_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

# Connect to SQLite database (it will be created if it doesn't exist)
conn = sqlite3.connect('example.db')
cursor = conn.cursor()

# Create a table with the random name
create_table_query = f'''
CREATE TABLE {table_name} (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER
);
'''

cursor.execute(create_table_query)
conn.commit()

print(f"Table '{table_name}' created successfully in 'example.db'.")

# Close the connection
conn.close()
