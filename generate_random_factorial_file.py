import random
import string
import os

def generate_random_filename():
    """Generate a random Python filename."""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for _ in range(10))
    return f"{random_name}.py"

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

# Generate a random filename
random_filename = generate_random_filename()

# Write the factorial function to the randomly named file
with open(random_filename, 'w') as file:
    file.write('def factorial(n):\n')
    file.write('    """\n')
    file.write('    Calculate the factorial of a number.\n')
    file.write('    \n')
    file.write('    Args:\n')
    file.write('        n (int): A non-negative integer\n')
    file.write('    \n')
    file.write('    Returns:\n')
    file.write('        int: The factorial of n\n')
    file.write('    \n')
    file.write('    Raises:\n')
    file.write('        ValueError: If n is negative\n')
    file.write('        TypeError: If n is not an integer\n')
    file.write('    """\n')
    file.write('    if not isinstance(n, int):\n')
    file.write('        raise TypeError("Input must be an integer")\n')
    file.write('\n')
    file.write('    if n < 0:\n')
    file.write('        raise ValueError("Factorial is not defined for negative numbers")\n')
    file.write('\n')
    file.write('    if n == 0 or n == 1:\n')
    file.write('        return 1\n')
    file.write('\n')
    file.write('    result = 1\n')
    file.write('    for i in range(2, n + 1):\n')
    file.write('        result *= i\n')
    file.write('\n')
    file.write('    return result\n')
    file.write('\n\n')
    file.write('# Example usage\n')
    file.write('if __name__ == "__main__":\n')
    file.write('    print(f"Factorial of 5: {factorial(5)}")\n')
    file.write('    print(f"Factorial of 0: {factorial(0)}")\n')
    file.write('    print(f"Factorial of 1: {factorial(1)}")\n')

print(f"Factorial function saved to: {random_filename}")