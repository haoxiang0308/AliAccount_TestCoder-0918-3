import psycopg2
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
