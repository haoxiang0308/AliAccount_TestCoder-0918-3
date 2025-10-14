import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    """
    Connects to a MySQL database and executes a SELECT query.
    The results are printed to the console.
    This script is saved with a random name.
    """
    connection = None
    try:
        # --- Configuration ---
        # Replace these values with your actual database credentials
        host = 'localhost'  # e.g., 'localhost' or an IP address
        database = 'your_database_name'
        user = 'your_username'
        password = 'your_password'
        table_name = 'your_table_name'  # The table you want to query
        # ---------------------

        connection = mysql.connector.connect(
            host=host,
            database=database,
            user=user,
            password=password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Example SELECT query - modify as needed
            select_query = f"SELECT * FROM {table_name};"
            cursor.execute(select_query)

            records = cursor.fetchall()
            print(f"Total number of rows in {table_name}: {cursor.rowcount}")
            print("\nPrinting each row:")
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
    # This script was generated with a static name for demonstration.
    # In a real scenario, you would use a command like:
    # python -c "import uuid; exec(open('template.py').read())" > script_$(uuid.uuid4().hex).py
    print("This script would be saved with a random name like 'script_ab3f2c...'")
    execute_select_query()
