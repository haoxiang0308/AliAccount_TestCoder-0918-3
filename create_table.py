import sqlite3
import random
import string

def create_random_table_name():
    """Generates a random table name."""
    return 'table_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

def create_table(db_path, table_name):
    """Connects to the database and creates a table with a given name."""
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()

    # Create the table with a dynamic name
    create_table_sql = f"""
    CREATE TABLE IF NOT EXISTS "{table_name}" (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER,
        email TEXT UNIQUE
    );
    """
    cursor.execute(create_table_sql)
    conn.commit()
    conn.close()
    print(f"Table '{table_name}' created successfully in {db_path}.")

if __name__ == "__main__":
    DATABASE_PATH = "example.db"
    TABLE_NAME = create_random_table_name()
    create_table(DATABASE_PATH, TABLE_NAME)
