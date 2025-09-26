import mysql.connector
import uuid

# Generate a random file name
random_filename = f"query_result_{uuid.uuid4().hex}.txt"

# Configuration for database connection
config = {
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',
    'database': 'your_database',
    'raise_on_warnings': True
}

try:
    # Establish the connection
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()

    # Define your SELECT query
    query = "SELECT * FROM your_table LIMIT 5;"  # Replace with your actual query
    cursor.execute(query)

    # Fetch all results
    results = cursor.fetchall()

    # Optionally, get column names
    columns = [desc[0] for desc in cursor.description]

    # Write results to the randomly named file
    with open(random_filename, 'w') as f:
        # Write column headers
        f.write('\t'.join(columns) + '\n')
        # Write rows
        for row in results:
            f.write('\t'.join(map(str, row)) + '\n')

    print(f"Query results saved to {random_filename}")

except mysql.connector.Error as err:
    print(f"Error: {err}")
finally:
    if cnx.is_connected():
        cursor.close()
        cnx.close()
        print("MySQL connection is closed.")