import mysql.connector
import uuid

# Generate a random filename
random_filename = f"query_result_{uuid.uuid4().hex}.txt"

# Configuration for your MySQL connection
# Please update these values according to your setup
config = {
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',  # or your MySQL server host
    'database': 'your_database',
    'raise_on_warnings': True
}

# SQL query to execute
query = "SELECT * FROM your_table LIMIT 5;"  # Replace with your desired query

try:
    # Establish the connection
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()

    # Execute the query
    cursor.execute(query)

    # Fetch all results
    results = cursor.fetchall()

    # Get column names
    column_names = [i[0] for i in cursor.description]

    # Print results to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(str(column_names) + '\n')
        for row in results:
            f.write(str(row) + '\n')

    print(f"Query results saved to {random_filename}")

except mysql.connector.Error as err:
    print(f"Error: {err}")
finally:
    # Close connections
    if 'cursor' in locals():
        cursor.close()
    if 'cnx' in locals():
        cnx.close()
