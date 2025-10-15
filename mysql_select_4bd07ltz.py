#!/usr/bin/env python3
"""
MySQL SELECT Query Script
This script connects to a MySQL database and executes a SELECT query.
"""

import mysql.connector
from mysql.connector import Error
import os
from dotenv import load_dotenv

# Load environment variables if a .env file exists
load_dotenv()

def connect_to_mysql():
    """
    Establish a connection to the MySQL database.
    Connection parameters can be configured below or through environment variables.
    """
    try:
        # You can modify these connection parameters as needed
        connection = mysql.connector.connect(
            host=os.getenv('MYSQL_HOST', 'localhost'),
            port=os.getenv('MYSQL_PORT', 3306),
            database=os.getenv('MYSQL_DATABASE', 'your_database'),
            user=os.getenv('MYSQL_USER', 'your_username'),
            password=os.getenv('MYSQL_PASSWORD', 'your_password')
        )
        
        if connection.is_connected():
            print("Successfully connected to MySQL database")
            return connection
            
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        return None

def execute_select_query(connection, query):
    """
    Execute a SELECT query and return the results.
    
    Args:
        connection: MySQL connection object
        query: SQL SELECT query string
    
    Returns:
        List of tuples containing the query results
    """
    try:
        cursor = connection.cursor()
        cursor.execute(query)
        
        # Fetch all results
        records = cursor.fetchall()
        
        # Get column names
        column_names = [desc[0] for desc in cursor.description]
        
        print(f"Query executed successfully. Found {len(records)} record(s)")
        print(f"Columns: {column_names}")
        
        return column_names, records
        
    except Error as e:
        print(f"Error executing query: {e}")
        return None, None
    finally:
        if cursor:
            cursor.close()

def main():
    """
    Main function to connect to MySQL and execute a SELECT query.
    """
    # Connect to MySQL
    connection = connect_to_mysql()
    
    if connection is None:
        print("Failed to connect to MySQL. Exiting.")
        return
    
    try:
        # Example SELECT query - modify this as needed
        select_query = "SELECT * FROM your_table LIMIT 10;"  # Change this to your actual query
        
        # Execute the SELECT query
        columns, results = execute_select_query(connection, select_query)
        
        if results:
            # Print the results
            print("\nQuery Results:")
            print("-" * 50)
            
            # Print column headers
            header = " | ".join(f"{col:15}" for col in columns)
            print(header)
            print("-" * len(header))
            
            # Print each row
            for row in results:
                formatted_row = " | ".join(f"{str(val):15}" for val in row)
                print(formatted_row)
        else:
            print("No results returned from query.")
            
    except Exception as e:
        print(f"An error occurred: {e}")
        
    finally:
        # Close the connection
        if connection.is_connected():
            connection.close()
            print("\nMySQL connection is closed")

if __name__ == "__main__":
    main()