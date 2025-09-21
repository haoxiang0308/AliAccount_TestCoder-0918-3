import random
import string

# Generate a random filename
filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.py'
print(f"Generated filename: {filename}")

# Create the factorial function
factorial_code = '''def factorial(n):
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

# Test the function
if __name__ == "__main__":
    test_values = [0, 1, 5, 10]
    for val in test_values:
        print(f"factorial({val}) = {factorial(val)}")
'''

# Write the code to the randomly named file
with open(filename, 'w') as f:
    f.write(factorial_code)

print(f"Factorial function saved to {filename}")