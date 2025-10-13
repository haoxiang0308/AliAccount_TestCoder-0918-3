import sqlite3
import random
import string

# Generate a random table name
def random_table_name():
    return 'table_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

# Main script logic
def main():
    # Connect to (or create) the SQLite database file
    conn = sqlite3.connect('example.db')
    cursor = conn.cursor()

    # Get a random table name
    table_name = random_table_name()
    print(f"Creating table: {table_name}")

    # SQL command to create a table with an 'id' and 'name' column
    create_table_sql = f"""
    CREATE TABLE IF NOT EXISTS {table_name} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        value REAL
    );
    """

    # Execute the SQL command
    cursor.execute(create_table_sql)

    # Commit the changes and close the connection
    conn.commit()
    conn.close()
    print(f"Table '{table_name}' created successfully in 'example.db'.")

if __name__ == "__main__":
    main()
