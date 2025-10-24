import configparser
import random
import string

def generate_random_filename(extension=".ini"):
    """Generate a random filename with the specified extension."""
    letters = string.ascii_lowercase + string.digits
    random_part = ''.join(random.choice(letters) for _ in range(10))
    return f"{random_part}{extension}"

def create_database_ini_config():
    """Create an INI configuration file with database settings."""
    # Create a ConfigParser object
    config = configparser.ConfigParser()
    
    # Add database section with various settings
    config['database'] = {
        'host': 'localhost',
        'port': '5432',
        'database': 'myapp_db',
        'username': 'db_user',
        'password': 'secure_password',
        'ssl_mode': 'require',
        'connection_timeout': '30',
        'max_connections': '20'
    }
    
    config['database_advanced'] = {
        'pool_size': '10',
        'pool_timeout': '30',
        'pool_recycle': '-1',
        'echo_sql': 'false'
    }
    
    # Generate a random filename
    filename = generate_random_filename('.ini')
    
    # Write the configuration to the file
    with open(filename, 'w') as configfile:
        config.write(configfile)
    
    print(f"Database configuration saved to: {filename}")
    return filename

if __name__ == "__main__":
    create_database_ini_config()