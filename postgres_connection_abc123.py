import psycopg2
from psycopg2 import sql
import os
from dotenv import load_dotenv

# Load environment variables from .env file if present
load_dotenv()

def connect_to_postgres():
    """
    Connect to PostgreSQL database using psycopg2
    Connection parameters can be configured through environment variables or directly in the code
    """
    try:
        # Database connection parameters - you can modify these or use environment variables
        connection_params = {
            'host': os.getenv('DB_HOST', 'localhost'),
            'database': os.getenv('DB_NAME', 'your_database_name'),
            'user': os.getenv('DB_USER', 'your_username'),
            'password': os.getenv('DB_PASSWORD', 'your_password'),
            'port': os.getenv('DB_PORT', '5432')
        }
        
        # Establish the connection
        connection = psycopg2.connect(**connection_params)
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute('SELECT version();')
        db_version = cursor.fetchone()
        print("Successfully connected to PostgreSQL database!")
        print(f"PostgreSQL database version: {db_version[0]}")
        
        return connection, cursor
        
    except (Exception, psycopg2.Error) as error:
        print(f"Error while connecting to PostgreSQL: {error}")
        return None, None

def close_connection(connection, cursor):
    """
    Close the database connection and cursor
    """
    if cursor:
        cursor.close()
    if connection:
        connection.close()
        print("PostgreSQL connection is closed.")

# Example usage
if __name__ == "__main__":
    conn, cur = connect_to_postgres()
    
    if conn and cur:
        # You can perform database operations here
        # For example, execute queries, insert data, etc.
        
        # Close the connection when done
        close_connection(conn, cur)
    else:
        print("Failed to establish connection.")