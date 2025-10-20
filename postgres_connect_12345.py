import psycopg2
from psycopg2 import sql
import random
import string

def connect_to_postgres():
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Connection parameters - these would need to be updated with actual values
        connection = psycopg2.connect(
            host="localhost",          # Replace with your host
            database="your_database",  # Replace with your database name
            user="your_username",      # Replace with your username
            password="your_password"   # Replace with your password
        )
        
        print("Successfully connected to PostgreSQL database!")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        
        print("PostgreSQL connection is closed.")
        
    except psycopg2.Error as error:
        print(f"Error while connecting to PostgreSQL: {error}")
        
        # If there's an error, try to close connection if it was partially created
        if 'connection' in locals():
            connection.close()

if __name__ == "__main__":
    connect_to_postgres()