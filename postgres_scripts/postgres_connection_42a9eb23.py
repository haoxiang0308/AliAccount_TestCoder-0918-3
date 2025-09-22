#!/usr/bin/env python3
"""
PostgreSQL Connection Script
This script demonstrates how to connect to a PostgreSQL database using psycopg2.
"""

import psycopg2
from psycopg2 import sql

def connect_to_postgres():
    """Establishes a connection to PostgreSQL database."""
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
        
        # Establishing the connection
        conn = psycopg2.connect(**conn_params)
        print("Connected to PostgreSQL database successfully!")
        
        # Creating a cursor object
        cur = conn.cursor()
        
        # Executing a simple query
        cur.execute("SELECT version();")
        
        # Fetching query result
        db_version = cur.fetchone()
        print(f"Database version: {db_version[0]}")
        
        # Closing the cursor and connection
        cur.close()
        conn.close()
        print("Database connection closed.")
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL database: {e}")

if __name__ == "__main__":
    connect_to_postgres()