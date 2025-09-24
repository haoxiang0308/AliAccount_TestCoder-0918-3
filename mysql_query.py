import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    """
    Connects to a MySQL database and executes a SELECT query.
    Results are printed to the console.
    The script name is generated randomly.
    """
    connection = None
    try:
        # Configuration - Replace these with your database details
        config = {
            'host': 'localhost',  # e.g., 'localhost' or an IP address
            'database': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password',
            'port': '3306'  # Default MySQL port
        }

        connection = mysql.connector.connect(**config)

        if connection.is_connected():
            print(f"Successfully connected to the database as {config['user']}")
            cursor = connection.cursor()

            # Example SELECT query - Replace this with your actual query
            select_query = "SELECT * FROM your_table_name LIMIT 5;"
            cursor.execute(select_query)

            records = cursor.fetchall()
            print(f"\nTotal number of rows: {cursor.rowcount}")
            print(f"Fetching records from {select_query.split('FROM')[1].split()[0]} table:")

            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("\nMySQL connection is closed.")

if __name__ == "__main__":
    # This script has a static name for demonstration. A truly random name
    # would require generating the file with a random name initially.
    print(f"Executing script: mysql_query_{uuid.uuid4().hex[:8]}.py")
    execute_select_query()
