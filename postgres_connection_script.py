import psycopg2
from psycopg2 import sql
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}.py"

def connect_to_postgres(host, database, user, password, port=5432):
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Establish the connection
        connection = psycopg2.connect(
            host=host,
            database=database,
            user=user,
            password=password,
            port=port
        )
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"Connected to PostgreSQL database!")
        print(f"PostgreSQL version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        
        return True
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return False

def save_connection_script():
    """
    Save a PostgreSQL connection script to a randomly named .py file
    """
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Content of the PostgreSQL connection script
    script_content = '''import psycopg2
from psycopg2 import sql

def connect_to_postgres(host, database, user, password, port=5432):
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Establish the connection
        connection = psycopg2.connect(
            host=host,
            database=database,
            user=user,
            password=password,
            port=port
        )
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"Connected to PostgreSQL database!")
        print(f"PostgreSQL version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        
        return True
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return False

# Example usage (fill in your actual credentials):
# connect_to_postgres(
#     host="localhost",
#     database="your_database_name",
#     user="your_username",
#     password="your_password"
# )
'''
    
    # Write the script content to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(script_content)
    
    print(f"PostgreSQL connection script saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    # Save the connection script to a randomly named file
    filename = save_connection_script()
    
    # Example of how to use the connection function (uncomment with actual credentials)
    # connect_to_postgres(
    #     host="localhost",
    #     database="your_database_name",
    #     user="your_username",
    #     password="your_password"
    # )