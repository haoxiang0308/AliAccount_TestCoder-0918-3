import psycopg2
from psycopg2 import sql
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def create_postgres_script():
    """Create a Python script to connect to PostgreSQL with psycopg2."""
    # PostgreSQL connection script content
    script_content = '''import psycopg2
from psycopg2 import sql

def connect_to_postgres(host, database, user, password, port=5432):
    """
    Connect to PostgreSQL database using psycopg2
    
    Args:
        host (str): Database host
        database (str): Database name
        user (str): Database user
        password (str): Database password
        port (int): Database port (default 5432)
    
    Returns:
        connection: psycopg2 connection object
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
        
        print("Successfully connected to PostgreSQL database!")
        return connection
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def main():
    # Example usage - replace these values with your actual database credentials
    db_host = "localhost"  # Replace with your host
    db_name = "your_database"  # Replace with your database name
    db_user = "your_username"  # Replace with your username
    db_password = "your_password"  # Replace with your password
    db_port = 5432  # Default PostgreSQL port
    
    # Connect to the database
    conn = connect_to_postgres(db_host, db_name, db_user, db_password, db_port)
    
    if conn:
        # Test the connection by executing a simple query
        cursor = conn.cursor()
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL version: {db_version[0]}")
        
        # Close connections
        cursor.close()
        conn.close()
        print("PostgreSQL connection closed.")

if __name__ == "__main__":
    main()
'''
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the script content to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(script_content)
    
    print(f"PostgreSQL connection script saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    create_postgres_script()