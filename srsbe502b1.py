import mysql.connector
import random
import string

def execute_mysql_select():
    """
    Connects to MySQL and executes a SELECT query.
    Note: You'll need to update the connection parameters with your MySQL server details.
    """
    try:
        # Establish connection to MySQL
        # Update these parameters with your MySQL server details
        connection = mysql.connector.connect(
            host='localhost',  # Replace with your MySQL host
            database='your_database',  # Replace with your database name
            user='your_username',  # Replace with your MySQL username
            password='your_password'  # Replace with your MySQL password
        )
        
        if connection.is_connected():
            cursor = connection.cursor()
            
            # Execute a SELECT query
            # Replace 'your_table' with the actual table name you want to query
            select_query = "SELECT * FROM your_table LIMIT 10;"
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            print(f"Total number of records: {cursor.rowcount}")
            print("Records:")
            for row in records:
                print(row)
                
    except mysql.connector.Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        # Close the connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

if __name__ == "__main__":
    execute_mysql_select()