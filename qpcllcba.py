#!/usr/bin/env python3
"""
PostgreSQL Connection Script
Connects to a PostgreSQL database using psycopg2
"""

import psycopg2
from psycopg2 import sql
import random
import string
import os

def generate_random_string(length=10):
    """Generate a random string of fixed length"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def connect_to_postgresql():
    """Establish connection to PostgreSQL database"""
    try:
        # Database connection parameters
        # Note: In production, use environment variables or a config file
        conn_params = {
            'dbname': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',
            'port': '5432'
        }
        
        # Establishing the connection
        conn = psycopg2.connect(**conn_params)
        print("Connected to PostgreSQL database successfully!")
        
        # Create a cursor object
        cur = conn.cursor()
        
        # Execute a simple query
        cur.execute("SELECT version();")
        
        # Fetch result
        db_version = cur.fetchone()
        print(f"PostgreSQL database version: {db_version}")
        
        # Close the cursor and connection
        cur.close()
        conn.close()
        print("Connection closed.")
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    # Generate a random table name for demonstration
    random_table_name = generate_random_string()
    print(f"Random identifier for this run: {random_table_name}")
    
    # Connect to the database
    connect_to_postgresql()