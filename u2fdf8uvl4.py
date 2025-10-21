import psycopg2
from psycopg2 import sql

def connect_to_postgres():
    """
    Connects to a PostgreSQL database using psycopg2.
    
    Make sure to replace the connection parameters with your actual database credentials.
    """
    try:
        # Replace these parameters with your actual PostgreSQL connection details
        connection = psycopg2.connect(
            host="localhost",          # Database host
            database="your_database",  # Database name
            user="your_username",      # Database user
            password="your_password",  # Database password
            port="5432"               # Database port (default is 5432)
        )
        
        print("Successfully connected to PostgreSQL!")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Example: Execute a simple query
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        
        return True
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return False

if __name__ == "__main__":
    connect_to_postgres()