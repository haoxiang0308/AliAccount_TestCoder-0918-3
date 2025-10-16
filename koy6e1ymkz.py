import mysql.connector
import uuid
import os

def execute_mysql_select_query():
    """
    Connects to a MySQL database and executes a SELECT query.
    """
    try:
        # Database connection parameters - these should be configured based on your setup
        config = {
            'user': os.getenv('MYSQL_USER', 'your_username'),
            'password': os.getenv('MYSQL_PASSWORD', 'your_password'),
            'host': os.getenv('MYSQL_HOST', 'localhost'),
            'database': os.getenv('MYSQL_DATABASE', 'your_database'),
            'raise_on_warnings': True
        }
        
        # Establish connection
        cnx = mysql.connector.connect(**config)
        cursor = cnx.cursor()
        
        # Example SELECT query - modify this query as needed
        query = "SELECT * FROM your_table_name LIMIT 10;"
        cursor.execute(query)
        
        # Fetch all results
        results = cursor.fetchall()
        
        # Print results
        for row in results:
            print(row)
        
        # Get column names
        columns = cursor.column_names
        print(f"Columns: {columns}")
        
        # Close connections
        cursor.close()
        cnx.close()
        
        return results
        
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None

if __name__ == "__main__":
    print("Executing MySQL SELECT query...")
    results = execute_mysql_select_query()
    if results:
        print(f"Query executed successfully. Retrieved {len(results)} rows.")
    else:
        print("Query execution failed or returned no results.")