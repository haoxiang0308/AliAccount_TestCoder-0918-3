import psycopg2
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
        # Establish connection
        connection = psycopg2.connect(
            host=host,
            database=database,
            user=user,
            password=password,
            port=port
        )
        
        print("Successfully connected to PostgreSQL database!")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        # Close cursor and connection
        cursor.close()
        connection.close()
        
        return True
        
    except psycopg2.Error as error:
        print(f"Error connecting to PostgreSQL: {error}")
        return False

def create_postgres_script():
    """
    Create a standalone PostgreSQL connection script
    """
    script_content = '''import psycopg2

def connect_to_postgres(host, database, user, password, port=5432):
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Establish connection
        connection = psycopg2.connect(
            host=host,
            database=database,
            user=user,
            password=password,
            port=port
        )
        
        print("Successfully connected to PostgreSQL database!")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        # Close cursor and connection
        cursor.close()
        connection.close()
        
        return True
        
    except psycopg2.Error as error:
        print(f"Error connecting to PostgreSQL: {error}")
        return False

# Example usage (remember to replace with your actual credentials)
if __name__ == "__main__":
    # Example connection (replace with your actual database credentials)
    # connect_to_postgres(host="localhost", database="your_db", user="your_user", password="your_password")
    pass
'''
    
    # Generate random filename
    random_filename = generate_random_filename()
    random_filepath = f"/workspace/{random_filename}"
    
    # Write the script to the randomly named file
    with open(random_filepath, 'w') as file:
        file.write(script_content)
    
    print(f"PostgreSQL connection script saved to: {random_filepath}")
    return random_filepath

if __name__ == "__main__":
    filepath = create_postgres_script()
    print(f"Created file: {filepath}")