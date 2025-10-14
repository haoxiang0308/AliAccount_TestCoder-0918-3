import mysql.connector
import uuid

# Generate a random filename
random_filename = f"query_result_{uuid.uuid4().hex}.txt"

# Configuration for database connection
config = {
    'user': 'your_username',
    'password': 'your_password',
    'host': '127.0.0.1',  # or your host address
    'database': 'your_database_name',
    'raise_on_warnings': True
}

# Establishing the connection
cnx = mysql.connector.connect(**config)
cursor = cnx.cursor()

# Example SELECT query
query = "SELECT * FROM your_table_name LIMIT 5;"
cursor.execute(query)

# Fetch all results
results = cursor.fetchall()

# Write results to the randomly named file
with open(random_filename, 'w') as f:
    for row in results:
        f.write(str(row) + '\n')

# Close connections
cursor.close()
cnx.close()

print(f"Query results saved to {random_filename}")