import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    """
    Connects to a MySQL database and executes a SELECT query.
    Results are printed to the console.
    """
    connection = None
    try:
        # --- Configuration: Update these values ---
        config = {
            'host': 'localhost',  # Replace with your host
            'database': 'your_database',  # Replace with your database name
            'user': 'your_username',  # Replace with your username
            'password': 'your_password'  # Replace with your password
        }

        connection = mysql.connector.connect(**config)

        if connection.is_connected():
            cursor = connection.cursor()
            # Example SELECT query - modify as needed
            select_query = "SELECT * FROM your_table LIMIT 10;"
            cursor.execute(select_query)

            records = cursor.fetchall()
            print(f"Fetched {cursor.rowcount} records.")
            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    # Generate a random filename for this script instance
    random_filename = f"executed_script_{uuid.uuid4().hex[:8]}.py"
    print(f"This script was originally saved as: {random_filename}")
    execute_select_query()
