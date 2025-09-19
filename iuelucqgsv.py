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
    
    Returns:
        connection object or None
    """
    try:
        # Database connection parameters
        # Please update these with your actual database credentials
        connection_params = {
            'dbname': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',  # or your database server IP
            'port': '5432'        # default PostgreSQL port
        }
        
        # Establishing the connection
        conn = psycopg2.connect(**connection_params)
        
        print("Connected to PostgreSQL database successfully!")
        
        # Create a cursor object
        cursor = conn.cursor()
        
        # Execute a simple query
        cursor.execute("SELECT version();")
        
        # Fetch result
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        return conn
        
    except (Exception, psycopg2.Error) as error:
        print(f"Error while connecting to PostgreSQL: {error}")
        return None

def close_connection(conn):
    """
    Closes the database connection.
    
    Args:
        conn: Database connection object
    """
    if conn:
        conn.close()
        print("PostgreSQL connection is closed.")

if __name__ == "__main__":
    # Connect to PostgreSQL
    connection = connect_to_postgresql()
    
    # Close the connection
    if connection:
        close_connection(connection)