import psycopg2
from psycopg2 import sql

def connect_to_db():
    """Connects to the PostgreSQL database server."""
    conn = None
    try:
        # Connect to the PostgreSQL server
        conn = psycopg2.connect(
            host="localhost",      # Replace with your host
            database="your_db",    # Replace with your database name
            user="your_user",      # Replace with your username
            password="your_pass"   # Replace with your password
        )
        print("Connected to PostgreSQL database!")
        return conn
    except psycopg2.OperationalError as e:
        print(f"Error connecting to PostgreSQL database: {e}")
        return conn # Return None if connection fails

def main():
    connection = connect_to_db()
    if connection:
        print("Connection object created successfully.")
        # Example: Create a cursor and execute a simple query
        cur = connection.cursor()
        cur.execute('SELECT version();')
        db_version = cur.fetchone()
        print(f"PostgreSQL database version: {db_version}")
        # Close communication with the database
        cur.close()
        connection.close()
        print("Database connection closed.")
    else:
        print("Failed to establish a connection.")

if __name__ == "__main__":
    main()