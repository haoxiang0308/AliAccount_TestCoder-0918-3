import json
import random
import string


def save_user_data(user_data):
    """
    Manipulates a user data dictionary and saves it to a file with a random name.

    Args:
        user_data (dict): A dictionary containing user information.

    Returns:
        str: The name of the file where the data was saved.
    """
    # Generate a random filename
    random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.json'
    
    # Write the user data dictionary to the file
    with open(random_filename, 'w', encoding='utf-8') as f:
        json.dump(user_data, f, ensure_ascii=False, indent=4)
    
    return random_filename


def load_user_data(filename):
    """
    Loads user data from a JSON file.

    Args:
        filename (str): The name of the file to load data from.

    Returns:
        dict: The user data dictionary loaded from the file.
    """
    with open(filename, 'r', encoding='utf-8') as f:
        return json.load(f)


# Example usage
if __name__ == "__main__":
    # Example user data
    user_info = {
        "name": "John Doe",
        "email": "john.doe@example.com",
        "age": 30,
        "preferences": {
            "language": "en",
            "theme": "dark"
        }
    }
    
    # Save the user data to a file with random name
    saved_filename = save_user_data(user_info)
    print(f"User data saved to: {saved_filename}")
    
    # Load the data back to verify
    loaded_data = load_user_data(saved_filename)
    print("Loaded user data:")
    print(json.dumps(loaded_data, indent=2))