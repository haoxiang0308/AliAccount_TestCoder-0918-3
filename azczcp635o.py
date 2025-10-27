import sqlite3
import random
import string

def create_sqlite_table():
    # Generate a random database name
    db_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.db'
    
    # Connect to SQLite database (or create it if it doesn't exist)
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    
    # Create a sample table
    table_name = 'users'
    cursor.execute(f'''
        CREATE TABLE IF NOT EXISTS {table_name} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT UNIQUE NOT NULL,
            age INTEGER,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ''')
    
    # Commit changes and close connection
    conn.commit()
    conn.close()
    
    print(f"Table '{table_name}' created successfully in database '{db_name}'")
    
    # Insert some sample data
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    
    sample_data = [
        ('John Doe', 'john@example.com', 30),
        ('Jane Smith', 'jane@example.com', 25),
        ('Bob Johnson', 'bob@example.com', 35)
    ]
    
    cursor.executemany(f'INSERT INTO {table_name} (name, email, age) VALUES (?, ?, ?)', sample_data)
    
    conn.commit()
    conn.close()
    
    print("Sample data inserted successfully")

if __name__ == "__main__":
    create_sqlite_table()