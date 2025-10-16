import psycopg2
from psycopg2 import sql
import sys

def connect_to_postgres():
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Database connection parameters
        connection = psycopg2.connect(
            host="localhost",          # Change this to your host
            database="your_database",  # Change this to your database name
            user="your_username",      # Change this to your username
            password="your_password"   # Change this to your password
        )
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print("PostgreSQL database version:", db_version)
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        
        print("PostgreSQL connection is closed")
        return True
        
    except (Exception, psycopg2.Error) as error:
        print(f"Error while connecting to PostgreSQL: {error}")
        return False

if __name__ == "__main__":
    print("Attempting to connect to PostgreSQL...")
    success = connect_to_postgres()
    if success:
        print("Successfully connected and executed a test query!")
    else:
        print("Failed to connect to PostgreSQL.")
        sys.exit(1)