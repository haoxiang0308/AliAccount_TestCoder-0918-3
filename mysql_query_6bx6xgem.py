#!/usr/bin/env python3
"""
MySQL SELECT Query Script
This script connects to a MySQL database and executes a SELECT query.
"""

import mysql.connector
from mysql.connector import Error
import os
from typing import List, Tuple, Optional


def connect_to_mysql(
    host: str = "localhost",
    database: str = "testdb",
    user: str = "root",
    password: str = ""
) -> Optional[mysql.connector.connection.MySQLConnection]:
    """
    Establish a connection to the MySQL database.
    
    Args:
        host: MySQL server host
        database: Database name
        user: Username
        password: Password
    
    Returns:
        MySQLConnection object or None if connection fails
    """
    try:
        connection = mysql.connector.connect(
            host=host,
            database=database,
            user=user,
            password=password
        )
        
        if connection.is_connected():
            print(f"Successfully connected to MySQL database: {database}")
            return connection
            
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        return None


def execute_select_query(connection: mysql.connector.connection.MySQLConnection, query: str) -> List[Tuple]:
    """
    Execute a SELECT query and return the results.
    
    Args:
        connection: MySQL connection object
        query: SQL SELECT query string
    
    Returns:
        List of tuples containing query results
    """
    try:
        cursor = connection.cursor()
        cursor.execute(query)
        
        # Fetch all results
        records = cursor.fetchall()
        
        # Get column names
        column_names = [desc[0] for desc in cursor.description]
        print(f"Column names: {column_names}")
        
        print(f"Total number of rows: {cursor.rowcount}")
        
        return records
        
    except Error as e:
        print(f"Error while executing SELECT query: {e}")
        return []
    finally:
        if cursor:
            cursor.close()


def print_results(results: List[Tuple], limit: int = 10):
    """
    Print query results in a formatted way.
    
    Args:
        results: List of tuples containing query results
        limit: Maximum number of rows to print
    """
    if not results:
        print("No results to display.")
        return
        
    print(f"\nDisplaying first {min(limit, len(results))} rows:")
    for i, row in enumerate(results[:limit]):
        print(f"Row {i+1}: {row}")
    
    if len(results) > limit:
        print(f"... and {len(results) - limit} more rows")


def main():
    """
    Main function to demonstrate MySQL SELECT query execution.
    """
    # Database connection parameters
    # You can modify these or set environment variables
    db_config = {
        'host': os.getenv('MYSQL_HOST', 'localhost'),
        'database': os.getenv('MYSQL_DATABASE', 'testdb'),
        'user': os.getenv('MYSQL_USER', 'root'),
        'password': os.getenv('MYSQL_PASSWORD', '')
    }
    
    # Establish connection
    connection = connect_to_mysql(**db_config)
    
    if connection:
        try:
            # Example SELECT query - modify as needed
            select_query = "SELECT * FROM users LIMIT 10;"  # Replace 'users' with your table name
            
            print(f"Executing query: {select_query}")
            
            # Execute the SELECT query
            results = execute_select_query(connection, select_query)
            
            # Print the results
            print_results(results)
            
        except Exception as e:
            print(f"An error occurred: {e}")
            
        finally:
            # Close the connection
            if connection.is_connected():
                connection.close()
                print("\nMySQL connection is closed.")


if __name__ == "__main__":
    main()