import mysql.connector
import uuid

# Generate a random file name
random_filename = f"query_result_{uuid.uuid4().hex}.txt"

# Configuration for your MySQL database
config = {
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',  # or your host address
    'database': 'your_database_name',
    'raise_on_warnings': True
}

# Establish a connection
cnx = mysql.connector.connect(**config)

# Create a cursor object
cursor = cnx.cursor()

# Define your SELECT query
query = "SELECT * FROM your_table_name LIMIT 5;"  # Example query

# Execute the query
cursor.execute(query)

# Fetch all results
results = cursor.fetchall()

# Optionally, get column names
column_names = [i[0] for i in cursor.description]

# Write results to the randomly named file
with open(random_filename, 'w') as f:
    # Write column headers
    f.write('\t'.join(column_names) + '\n')
    # Write rows
    for row in results:
        f.write('\t'.join(map(str, row)) + '\n')

# Close connections
cursor.close()
cnx.close()

print(f"Query results saved to {random_filename}")