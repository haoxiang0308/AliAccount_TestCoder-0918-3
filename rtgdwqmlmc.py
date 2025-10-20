import psycopg2

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
