import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    """Connects to MySQL and executes a SELECT query."""
    connection = None
    cursor = None
    try:
        # Configuration - Replace these with your actual database details
        config = {
            'host': 'localhost',  # or your MySQL server address
            'database': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password'
        }

        connection = mysql.connector.connect(**config)
        if connection.is_connected():
            print("Successfully connected to MySQL database")
            cursor = connection.cursor()

            # Example SELECT query - Replace 'your_table' and 'your_columns' with actual names
            select_query = "SELECT * FROM your_table LIMIT 5;"
            cursor.execute(select_query)

            records = cursor.fetchall()
            print(f"Total number of rows: {cursor.rowcount}")
            print("Printing each row:")
            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        if connection and connection.is_connected():
            if cursor:
                cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    # Generate a random filename for this script
    random_filename = f"mysql_query_script_{uuid.uuid4().hex[:8]}.py"
    print(f"This script could be saved as: {random_filename}")
    print("-" * 40)
    execute_select_query()
