import mysql.connector
import random
import string

def execute_select_query():
    """
    Connects to MySQL database and executes a SELECT query
    """
    try:
        # Database connection parameters - these should be configured based on your setup
        config = {
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',  # or your MySQL server address
            'database': 'your_database',
            'raise_on_warnings': True
        }
        
        # Establish connection
        connection = mysql.connector.connect(**config)
        
        if connection.is_connected():
            cursor = connection.cursor()
            
            # Example SELECT query - modify as needed
            select_query = "SELECT * FROM your_table LIMIT 10;"
            cursor.execute(select_query)
            
            # Fetch results
            records = cursor.fetchall()
            
            print(f"Total number of records: {cursor.rowcount}")
            for row in records:
                print(row)
                
    except mysql.connector.Error as error:
        print(f"Error while connecting to MySQL: {error}")
        
    finally:
        # Close connections
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

def generate_random_filename():
    """
    Generates a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

if __name__ == "__main__":
    execute_select_query()