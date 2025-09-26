import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    connection = None
    try:
        # Establish the connection
        connection = mysql.connector.connect(
            host='localhost',  # or your MySQL server host
            database='your_database_name',  # Replace with your database name
            user='your_username',  # Replace with your MySQL username
            password='your_password'  # Replace with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Example SELECT query - replace with your actual query
            select_query = "SELECT * FROM your_table_name LIMIT 10;"  # Replace with your query
            cursor.execute(select_query)

            # Fetch all records
            records = cursor.fetchall()

            # Print the records (or process them as needed)
            print("Records from the table:")
            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        # Close the connection
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    execute_select_query()
