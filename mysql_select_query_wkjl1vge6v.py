#!/usr/bin/env python3
"""
MySQL SELECT Query Script
This script demonstrates how to connect to a MySQL database and execute a SELECT query.
"""

import mysql.connector
from mysql.connector import Error
import os
from dotenv import load_dotenv

# Load environment variables from .env file (if exists)
load_dotenv()

def connect_and_select():
    """
    Connect to MySQL database and execute a SELECT query
    """
    connection = None
    cursor = None
    
    try:
        # Database connection parameters
        # You can set these as environment variables for security
        config = {
            'host': os.getenv('DB_HOST', 'localhost'),
            'database': os.getenv('DB_NAME', 'your_database'),
            'user': os.getenv('DB_USER', 'your_username'),
            'password': os.getenv('DB_PASSWORD', 'your_password'),
            'port': int(os.getenv('DB_PORT', 3306))
        }
        
        print("Attempting to connect to MySQL database...")
        connection = mysql.connector.connect(**config)
        
        if connection.is_connected():
            print(f"Successfully connected to MySQL Server version {connection.get_server_info()}")
            
            # Create cursor object
            cursor = connection.cursor()
            
            # Example SELECT query - you can modify this as needed
            select_query = "SELECT * FROM your_table_name LIMIT 10;"
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            # Get column names
            column_names = [desc[0] for desc in cursor.description]
            print(f"Column names: {column_names}")
            
            print(f"Total number of records: {cursor.rowcount}")
            print("Records:")
            for row in records:
                print(row)
                
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        # Close connections
        if connection and connection.is_connected():
            if cursor:
                cursor.close()
            connection.close()
            print("MySQL connection is closed")

def connect_and_select_with_where():
    """
    Connect to MySQL database and execute a SELECT query with WHERE clause
    """
    connection = None
    cursor = None
    
    try:
        # Database connection parameters
        config = {
            'host': os.getenv('DB_HOST', 'localhost'),
            'database': os.getenv('DB_NAME', 'your_database'),
            'user': os.getenv('DB_USER', 'your_username'),
            'password': os.getenv('DB_PASSWORD', 'your_password'),
            'port': int(os.getenv('DB_PORT', 3306))
        }
        
        connection = mysql.connector.connect(**config)
        
        if connection.is_connected():
            print("\nExecuting SELECT with WHERE clause...")
            cursor = connection.cursor()
            
            # Example SELECT query with WHERE - you can modify this as needed
            select_query = "SELECT * FROM your_table_name WHERE id > %s;"
            cursor.execute(select_query, (0,))  # Parameterized query to prevent SQL injection
            
            records = cursor.fetchall()
            column_names = [desc[0] for desc in cursor.description]
            print(f"Column names: {column_names}")
            
            print(f"Total number of records: {cursor.rowcount}")
            for row in records:
                print(row)
                
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        if connection and connection.is_connected():
            if cursor:
                cursor.close()
            connection.close()

if __name__ == "__main__":
    print("Starting MySQL SELECT query example...")
    connect_and_select()
    connect_and_select_with_where()