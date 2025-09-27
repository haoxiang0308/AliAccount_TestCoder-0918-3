import mysql.connector
import uuid

# Generate a random filename
random_filename = f"query_result_{uuid.uuid4().hex}.txt"

# --- Database Connection Configuration ---
# Replace these values with your actual database credentials
config = {
    'user': 'your_username',
    'password': 'your_password',
    'host': 'your_host',  # e.g., 'localhost' or an IP address
    'database': 'your_database_name',
    'raise_on_warnings': True
}
# --- End Configuration ---

try:
    # Establish the connection
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()

    # Define your SELECT query here
    query = "SELECT * FROM your_table_name LIMIT 5;" # Example query, change as needed
    cursor.execute(query)

    # Fetch all results
    results = cursor.fetchall()

    # Get column names
    column_names = [i[0] for i in cursor.description]

    # Save results to the randomly named file
    with open(random_filename, 'w') as f:
        # Write column headers
        f.write('\t'.join(column_names) + '\n')
        # Write rows
        for row in results:
            f.write('\t'.join(map(str, row)) + '\n')

    print(f"Query results successfully saved to {random_filename}")

except mysql.connector.Error as err:
    print(f"Error: {err}")
finally:
    # Close connections
    if 'cursor' in locals():
        cursor.close()
    if 'cnx' in locals() and cnx.is_connected():
        cnx.close()
        print("MySQL connection is closed.")