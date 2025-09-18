import mysql.connector
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def execute_select_query():
    """Execute a SELECT query on MySQL database"""
    try:
        # Database connection parameters
        config = {
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',
            'database': 'your_database',
            'raise_on_warnings': True
        }
        
        # Establish connection
        connection = mysql.connector.connect(**config)
        cursor = connection.cursor()
        
        # Execute SELECT query
        query = "SELECT * FROM your_table LIMIT 10"
        cursor.execute(query)
        
        # Fetch and print results
        results = cursor.fetchall()
        for row in results:
            print(row)
            
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        
    finally:
        # Close connections
        if 'cursor' in locals():
            cursor.close()
        if 'connection' in locals() and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    # Generate random filename
    filename = generate_random_filename()
    print(f"Script saved as: {filename}")
    
    # Execute the query
    execute_select_query()