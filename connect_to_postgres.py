import psycopg2

def connect_to_db():
  """Connects to the PostgreSQL database."""
  try:
    # Replace these with your actual database credentials
    connection = psycopg2.connect(
        host="localhost",      # e.g., 'localhost' or an IP address
        database="your_db_name",
        user="your_username",
        password="your_password",
        port=5432              # Default PostgreSQL port
    )
    print("Successfully connected to PostgreSQL!")
    return connection

  except psycopg2.Error as e:
    print(f"Error connecting to PostgreSQL: {e}")
    return None

if __name__ == "__main__":
    conn = connect_to_db()
    if conn:
        cursor = conn.cursor()
        cursor.execute('SELECT version();')
        db_version = cursor.fetchone()
        print(f"PostgreSQL Database Version: {db_version[0]}")
        cursor.close()
        conn.close()
        print("Connection closed.")
    else:
        print("Failed to establish a connection.")