import mysql.connector
import os

# Database connection details (replace with your own)
config = {
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',  # or your MySQL server address
    'database': 'your_database_name',
    'raise_on_warnings': True
}

def execute_select_query(query):
    """
    Connects to the MySQL database, executes a SELECT query, and prints the results.
    """
    try:
        # Establish the connection
        cnx = mysql.connector.connect(**config)
        cursor = cnx.cursor()

        # Execute the query
        print(f"Executing query: {query}")
        cursor.execute(query)

        # Fetch all results
        rows = cursor.fetchall()

        # Get column names
        column_names = [desc[0] for desc in cursor.description]
        print(f"Columns: {column_names}")

        # Print results
        for row in rows:
            print(row)

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        # Close connections
        if cursor:
            cursor.close()
        if cnx and cnx.is_connected():
            cnx.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    # Example SELECT query - replace this with your desired query
    select_query = "SELECT * FROM your_table_name LIMIT 5;"
    execute_select_query(select_query)
