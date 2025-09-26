import psycopg2
from psycopg2 import sql

# Database connection parameters
conn_params = {
    "host": "localhost",
    "database": "your_database_name",
    "user": "your_username",
    "password": "your_password",
    "port": "5432"
}

def connect_to_db():
    """Connects to the PostgreSQL database."""
    try:
        # Establish the connection
        conn = psycopg2.connect(**conn_params)
        print("Connection to PostgreSQL DB successful")
        return conn
    except psycopg2.OperationalError as e:
        print(f"The error '{e}' occurred")
        return None

if __name__ == "__main__":
    connection = connect_to_db()
    if connection:
        connection.close()
        print("Connection closed.")