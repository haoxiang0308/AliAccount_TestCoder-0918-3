#!/usr/bin/env python3
"""
MySQL SELECT Query Executor
This script connects to a MySQL database and executes a SELECT query.
"""

import mysql.connector
from mysql.connector import Error

def connect_and_query():
    """Connect to MySQL database and execute a SELECT query"""
    connection = None
    try:
        # Database connection parameters
        connection = mysql.connector.connect(
            host='localhost',       # Replace with your host
            database='testdb',      # Replace with your database name
            user='root',            # Replace with your username
            password='password'     # Replace with your password
        )
        
        if connection.is_connected():
            print("Successfully connected to MySQL database")
            
            # Create cursor object
            cursor = connection.cursor()
            
            # Execute SELECT query
            query = "SELECT * FROM users;"  # Replace with your table name
            cursor.execute(query)
            
            # Fetch all results
            records = cursor.fetchall()
            
            print(f"Total number of records: {cursor.rowcount}")
            
            # Print all records
            for row in records:
                print(row)
                
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        # Close database connection
        if connection is not None and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    connect_and_query()