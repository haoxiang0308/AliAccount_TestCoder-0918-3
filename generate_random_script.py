import random
import string
import os

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Content for the SQLite table creation script
sqlite_script_content = '''import sqlite3
import random
import string

def create_table():
    # Generate a random database name
    db_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.db'
    
    # Connect to SQLite database (creates it if it doesn't exist)
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    
    # Create a sample table
    table_name = ''.join(random.choices(string.ascii_lowercase, k=8))
    cursor.execute(f"""
        CREATE TABLE IF NOT EXISTS {table_name} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT UNIQUE,
            age INTEGER,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    """)
    
    # Commit changes and close connection
    conn.commit()
    conn.close()
    
    print(f"Table '{table_name}' created successfully in database '{db_name}'")
    
    return db_name, table_name

if __name__ == "__main__":
    db_name, table_name = create_table()
'''

# Write the content to the randomly named file
with open(random_filename, 'w') as f:
    f.write(sqlite_script_content)

print(f"SQLite table creation script saved to: {random_filename}")