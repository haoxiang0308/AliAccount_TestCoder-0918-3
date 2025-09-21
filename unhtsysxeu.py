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

def connect_to_postgres():
    """Establish connection to PostgreSQL database"""
    try:
        # Database connection parameters
        # Note: In production, these should be stored in environment variables
        connection_params = {
            'host': 'localhost',
            'database': 'testdb',
            'user': 'postgres',
            'password': 'password',
            'port': '5432'
        }
        
        # Establish connection
        connection = psycopg2.connect(**connection_params)
        cursor = connection.cursor()
        
        # Print PostgreSQL connection properties
        print("Connected to PostgreSQL database")
        print("PostgreSQL connection properties:")
        print(connection.get_dsn_parameters())
        
        # Execute a simple query
        cursor.execute("SELECT version();")
        record = cursor.fetchone()
        print(f"PostgreSQL version: {record}")
        
        # Close database connection
        cursor.close()
        connection.close()
        print("PostgreSQL connection closed")
        
    except (Exception, psycopg2.Error) as error:
        print(f"Error while connecting to PostgreSQL: {error}")
        
if __name__ == "__main__":
    print("PostgreSQL Connection Test")
    print("=" * 30)
    connect_to_postgres()