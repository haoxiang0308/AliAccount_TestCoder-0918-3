#!/usr/bin/env python3
"""
MySQL SELECT Query Executor
This script connects to a MySQL database and executes a SELECT query.
"""

import mysql.connector
from mysql.connector import Error

def connect_to_mysql():
    """Establish a connection to the MySQL database."""
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='testdb',
            user='root',
            password='password'
        )
        
        if connection.is_connected():
            print("Successfully connected to MySQL database")
            return connection
    
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        return None

def execute_select_query(connection, query):
    """Execute a SELECT query and return the results."""
    try:
        cursor = connection.cursor()
        cursor.execute(query)
        records = cursor.fetchall()
        
        print(f"Total number of records: {cursor.rowcount}")
        return records
    
    except Error as e:
        print(f"Error while executing query: {e}")
        return None
    
    finally:
        if cursor:
            cursor.close()

def main():
    """Main function to connect and query."""
    connection = connect_to_mysql()
    
    if connection is None:
        return
    
    try:
        # Example SELECT query
        query = "SELECT * FROM employees LIMIT 5"
        records = execute_select_query(connection, query)
        
        if records:
            print("Records retrieved:")
            for row in records:
                print(row)
    
    finally:
        if connection.is_connected():
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    main()