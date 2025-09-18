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

def save_function_to_file(filename):
    """Save the factorial function to a Python file."""
    function_content = '''
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
    
    with open(filename, 'w') as f:
        f.write(function_content)
    
    print(f"Function saved to {filename}")

# Example usage
if __name__ == "__main__":
    # Generate a random filename
    filename = generate_random_filename()
    print(f"Random filename: {filename}")
    
    # Save the factorial function to the file
    save_function_to_file(filename)
    
    # Test the factorial function
    test_number = 5
    result = factorial(test_number)
    print(f"Factorial of {test_number} is {result}")