import psycopg2
from psycopg2 import sql

def connect_to_db():
    """Connects to the PostgreSQL database."""
    try:
        # Replace these connection parameters with your actual database details
        connection = psycopg2.connect(
            host="localhost",      # e.g., 'localhost' or an IP address
            database="your_db_name",
            user="your_username",
            password="your_password",
            port=5432              # Default PostgreSQL port
        )
        print("Connected to PostgreSQL database!")
        return connection
    except psycopg2.OperationalError as e:
        print(f"Error connecting to PostgreSQL database: {e}")
        return None

if __name__ == "__main__":
    conn = connect_to_db()
    if conn:
        conn.close()
        print("Connection closed.")