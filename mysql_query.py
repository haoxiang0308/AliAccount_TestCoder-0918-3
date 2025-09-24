import mysql.connector
import uuid

# Generate a random file name
random_filename = f"query_result_{uuid.uuid4().hex}.txt"

# Database connection details (replace with your own)
config = {
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',  # or your MySQL server address
    'database': 'your_database',
    'raise_on_warnings': True
}

try:
    # Establish connection
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()

    # Execute SELECT query
    query = "SELECT * FROM your_table LIMIT 5;"  # Replace with your query
    cursor.execute(query)

    # Fetch results
    rows = cursor.fetchall()

    # Write results to the randomly named file
    with open(random_filename, 'w') as f:
        for row in rows:
            f.write(str(row) + '\n')

    print(f"Query results saved to {random_filename}")

except mysql.connector.Error as err:
    print(f"Error: {err}")
finally:
    # Close connections
    if cursor:
        cursor.close()
    if cnx:
        cnx.close()
