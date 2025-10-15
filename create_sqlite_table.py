import sqlite3
import random
import string

def create_connection(db_file):
    """Create a database connection to the SQLite database specified by db_file"""
    conn = None
    try:
        conn = sqlite3.connect(db_file)
        print(f'Successfully connected to SQLite database: {db_file}')
    except sqlite3.Error as e:
        print(f'Error connecting to database: {e}')
    return conn

def create_table(conn):
    """Create a sample table in the SQLite database"""
    try:
        cursor = conn.cursor()
        
        # Define the table schema
        create_table_sql = """
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT UNIQUE NOT NULL,
            age INTEGER,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
        """
        
        cursor.execute(create_table_sql)
        conn.commit()
        print('Table "users" created successfully')
        
    except sqlite3.Error as e:
        print(f'Error creating table: {e}')

def main():
    # Generate a random database filename
    random_db_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.db'
    
    # Create a database connection
    conn = create_connection(random_db_name)
    
    if conn is not None:
        # Create the table
        create_table(conn)
        
        # Close the connection
        conn.close()
        print(f'Connection to {random_db_name} closed')
    else:
        print('Error! Cannot create database connection')

if __name__ == '__main__':
    main()