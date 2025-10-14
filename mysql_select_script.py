import mysql.connector
import os
import uuid

# Generate a random filename
random_filename = f"query_results_{uuid.uuid4().hex}.txt"

# Database connection details (replace with your own)
config = {
    'user': os.getenv('DB_USER', 'your_username'),
    'password': os.getenv('DB_PASSWORD', 'your_password'),
    'host': os.getenv('DB_HOST', 'localhost'),
    'database': os.getenv('DB_NAME', 'your_database'),
    'raise_on_warnings': True
}

try:
    # Establish connection
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()

    # Execute SELECT query (replace with your own query)
    query = "SELECT * FROM your_table LIMIT 5;"
    cursor.execute(query)

    # Fetch results
    rows = cursor.fetchall()

    # Write results to the randomly named file
    with open(random_filename, 'w') as f:
        for row in rows:
            f.write(str(row) + '\\n')

    print(f"Query results saved to {random_filename}")

except mysql.connector.Error as err:
    print(f"Error: {err}")
finally:
    # Close connections
    if 'cursor' in locals():
        cursor.close()
    if 'cnx' in locals():
        cnx.close()