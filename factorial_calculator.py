import random
import string
import os

def factorial(n):
    """
    Calculate the factorial of a number.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n
    
    Raises:
        ValueError: If n is negative
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    
    if n == 0 or n == 1:
        return 1
    
    result = 1
    for i in range(2, n + 1):
        result *= i
    
    return result

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def save_factorial_to_random_file():
    """Save the factorial function to a randomly named Python file."""
    # Generate random filename
    filename = generate_random_filename()
    
    # Define the content to save
    content = '''
def factorial(n):
    """
    Calculate the factorial of a number.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n
    
    Raises:
        ValueError: If n is negative
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    
    if n == 0 or n == 1:
        return 1
    
    result = 1
    for i in range(2, n + 1):
        result *= i
    
    return result

# Example usage
if __name__ == "__main__":
    test_number = 5
    result = factorial(test_number)
    print(f"Factorial of {test_number} is {result}")
'''
    
    # Save to file
    with open(filename, 'w') as f:
        f.write(content.strip())
    
    return filename

# Example usage
if __name__ == "__main__":
    # Save the factorial function to a random file
    saved_filename = save_factorial_to_random_file()
    print(f"Factorial function saved to: {saved_filename}")
    
    # Test the saved function by importing and running it
    module_name = saved_filename[:-3]  # Remove .py extension
    print(f"You can now import and use the factorial function from {module_name}")