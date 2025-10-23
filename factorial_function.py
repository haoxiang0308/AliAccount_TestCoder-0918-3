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
        TypeError: If n is not an integer
    """
    if not isinstance(n, int):
        raise TypeError("Input must be an integer")
    
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    
    if n == 0 or n == 1:
        return 1
    
    result = 1
    for i in range(2, n + 1):
        result *= i
    
    return result


def save_factorial_function_to_random_file():
    """
    Save the factorial function to a randomly named Python file.
    
    Returns:
        str: The name of the created file
    """
    # Generate a random filename
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    filename = f"/workspace/{random_name}.py"
    
    # Content to write to the file
    content = '''def factorial(n):
    """
    Calculate the factorial of a number.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n
    
    Raises:
        ValueError: If n is negative
        TypeError: If n is not an integer
    """
    if not isinstance(n, int):
        raise TypeError("Input must be an integer")
    
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    
    if n == 0 or n == 1:
        return 1
    
    result = 1
    for i in range(2, n + 1):
        result *= i
    
    return result
'''
    
    # Write the content to the randomly named file
    with open(filename, 'w') as f:
        f.write(content)
    
    print(f"Factorial function saved to: {filename}")
    return filename


# Example usage
if __name__ == "__main__":
    # Test the factorial function
    print("Testing factorial function:")
    print(f"factorial(5) = {factorial(5)}")
    print(f"factorial(0) = {factorial(0)}")
    print(f"factorial(1) = {factorial(1)}")
    
    # Save to a randomly named file
    random_file = save_factorial_function_to_random_file()
    print(f"Function saved to: {random_file}")