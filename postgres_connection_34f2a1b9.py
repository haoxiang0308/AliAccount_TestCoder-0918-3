#!/usr/bin/env python3
"""
PostgreSQL Connection Script
This script demonstrates how to connect to a PostgreSQL database using psycopg2.
"""

import psycopg2
from psycopg2 import sql

def connect_to_postgresql():
    """
    Establishes a connection to a PostgreSQL database.
    Returns a connection object if successful, None otherwise.
    """
    try:
        # Database connection parameters
        # Please update these with your actual database credentials
        conn_params = {
            'dbname': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',  # or your database server IP
            'port': '5432'        # default PostgreSQL port
        }
        
        # Attempt to establish a connection
        conn = psycopg2.connect(**conn_params)
        print("Connected to PostgreSQL database successfully!")
        return conn
        
    except psycopg2.OperationalError as e:
        print(f"Unable to connect to the database. Please check your connection parameters and ensure PostgreSQL is running.")
        print(f"Error details: {e}")
        return None
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def main():
    """
    Main function to demonstrate the PostgreSQL connection.
    """
    print("PostgreSQL Connection Demo")
    print("=" * 30)
    
    # Connect to the database
    connection = connect_to_postgresql()
    
    if connection:
        try:
            # Create a cursor object
            cursor = connection.cursor()
            
            # Execute a simple query
            cursor.execute("SELECT version();")
            
            # Fetch the result
            db_version = cursor.fetchone()
            print(f"Database version: {db_version[0]}")
            
            # Close the cursor
            cursor.close()
            
        except psycopg2.Error as e:
            print(f"Error executing query: {e}")
        finally:
            # Close the connection
            connection.close()
            print("Database connection closed.")
    else:
        print("\nTo use this script:")
        print("1. Ensure you have a PostgreSQL server running")
        print("2. Install psycopg2: pip install psycopg2-binary")
        print("3. Update the connection parameters in the script with your database credentials")
        print("4. Run the script again")

if __name__ == "__main__":
    main()