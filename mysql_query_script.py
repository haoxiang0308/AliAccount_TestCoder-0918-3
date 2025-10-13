import mysql.connector
import os
import uuid

def execute_select_query():
    """
    Connects to a MySQL database using environment variables for credentials,
    executes a SELECT query, and prints the results.
    """
    # Get database credentials from environment variables
    config = {
        'user': os.getenv('DB_USER', 'root'),
        'password': os.getenv('DB_PASSWORD', ''),
        'host': os.getenv('DB_HOST', 'localhost'),
        'database': os.getenv('DB_NAME', 'testdb'),
        'port': os.getenv('DB_PORT', 3306)
    }

    # Create a unique filename for this execution
    unique_filename = f"query_output_{uuid.uuid4().hex}.txt"
    print(f"Connecting to MySQL database...")
    print(f"The results of the query will be saved to {unique_filename}")

    try:
        # Establish the connection
        connection = mysql.connector.connect(**config)

        if connection.is_connected():
            cursor = connection.cursor()
            # Example SELECT query - change this as needed
            query = "SELECT * FROM information_schema.tables LIMIT 5;"
            print(f"Executing query: {query}")
            cursor.execute(query)

            # Fetch all results
            records = cursor.fetchall()

            # Print results to console
            print("Query results:")
            for row in records:
                print(row)

            # Write results to the unique file
            with open(unique_filename, 'w') as f:
                for row in records:
                    f.write(str(row) + '\\n')
            print(f"Results saved to {unique_filename}")

    except mysql.connector.Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        # Close the connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    execute_select_query()
