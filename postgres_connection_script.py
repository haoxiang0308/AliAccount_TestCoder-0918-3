import psycopg2
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
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
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"Connected to PostgreSQL database!")
        print(f"PostgreSQL version: {db_version[0]}")
        
        # Close cursor and connection
        cursor.close()
        connection.close()
        
        return True
        
    except psycopg2.Error as error:
        print(f"Error connecting to PostgreSQL: {error}")
        return False

# Example usage
if __name__ == "__main__":
    # Database connection parameters (replace with your actual values)
    HOST = "localhost"  # or your PostgreSQL server address
    DATABASE = "your_database_name"
    USER = "your_username"
    PASSWORD = "your_password"
    PORT = 5432  # default PostgreSQL port
    
    # Connect to the database
    success = connect_to_postgres(HOST, DATABASE, USER, PASSWORD, PORT)
    
    if success:
        print("Successfully connected and executed test query!")
    else:
        print("Failed to connect to the database.")
    
    # Generate a random filename and save this script with that name
    random_filename = generate_random_filename()
    import shutil
    shutil.copy(__file__, f"/workspace/{random_filename}")
    print(f"Script has been saved with the random name: {random_filename}")