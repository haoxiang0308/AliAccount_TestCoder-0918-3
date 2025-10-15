import psycopg2
from psycopg2 import sql
import random
import string

def connect_to_postgres(host, database, user, password, port=5432):
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Establish connection
        connection = psycopg2.connect(
            host=host,
            database=database,
            user=user,
            password=password,
            port=port
        )
        
        print("Successfully connected to PostgreSQL database!")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        return connection, cursor
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None, None

def close_connection(connection, cursor):
    """
    Close the database connection and cursor
    """
    if cursor:
        cursor.close()
    if connection:
        connection.close()
        print("PostgreSQL connection closed.")

# Example usage
if __name__ == "__main__":
    # Database connection parameters
    # Note: Replace these with your actual database credentials
    DB_HOST = "localhost"  # or your database host
    DB_NAME = "your_database_name"
    DB_USER = "your_username"
    DB_PASSWORD = "your_password"
    DB_PORT = 5432  # default PostgreSQL port
    
    # Connect to the database
    conn, cur = connect_to_postgres(DB_HOST, DB_NAME, DB_USER, DB_PASSWORD, DB_PORT)
    
    if conn and cur:
        # Perform database operations here
        # For example, you can execute queries
        
        # Close the connection
        close_connection(conn, cur)