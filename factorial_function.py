import random
import string

def factorial(n):
    """
    Calculate the factorial of a number n.
    
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

# Generate a random filename
def generate_random_filename():
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase + string.digits
    random_string = ''.join(random.choice(letters) for _ in range(10))
    return f"/workspace/{random_string}.py"

# Save the factorial function to a randomly named file
random_filename = generate_random_filename()
with open(random_filename, 'w') as f:
    f.write('''def factorial(n):
    """
    Calculate the factorial of a number n.
    
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
    return result''')

print(f"Factorial function saved to: {random_filename}")