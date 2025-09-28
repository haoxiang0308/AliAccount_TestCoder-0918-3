import sqlite3
import random
import string

def create_random_table_name():
    """Generates a random table name."""
    return 'table_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

def create_table(db_name='example.db'):
    """Connects to the SQLite database and creates a table with a random name."""
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()

    table_name = create_random_table_name()
    create_table_sql = f'''
    CREATE TABLE IF NOT EXISTS {table_name} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER,
        email TEXT UNIQUE
    );
    '''
    cursor.execute(create_table_sql)
    conn.commit()
    print(f"Table '{table_name}' created successfully in {db_name}.")

    conn.close()

if __name__ == "__main__":
    create_table()
