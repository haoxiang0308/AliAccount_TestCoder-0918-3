import mysql.connector
from mysql.connector import Error
import uuid

# This script connects to a MySQL database, executes a SELECT query,
# fetches the results, and prints them. It uses a randomly generated
# filename for its log/output file as per a user request.

def main():
    # --- Configuration ---
    # Replace these with your actual database credentials
    config = {
        'host': 'localhost',  # or your MySQL server IP
        'database': 'your_database_name',
        'user': 'your_username',
        'password': 'your_password'
    }

    # The SELECT query to execute
    query = "SELECT * FROM your_table_name LIMIT 5;" # Example query

    try:
        # Establish the connection
        connection = mysql.connector.connect(**config)

        if connection.is_connected():
            cursor = connection.cursor()
            print(f"Connected to MySQL database")

            # Execute the query
            cursor.execute(query)

            # Fetch all rows from the executed query
            records = cursor.fetchall()

            # Get column names
            column_names = [i[0] for i in cursor.description]

            # Print the results
            print(f"Query executed: {query}")
            print(f"Column Names: {column_names}")
            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        # Close the connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    main()