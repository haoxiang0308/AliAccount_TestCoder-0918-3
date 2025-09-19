import random
import string

# Generate a random filename
filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.py'
print(f"Creating file: {filename}")

# Create the content for our factorial function
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

# Example usage
if __name__ == "__main__":
    number = 5
    print(f"The factorial of {number} is {factorial(number)}")
'''

# Write the content to the randomly named file
with open(filename, 'w') as f:
    f.write(content)

print(f"File {filename} has been created with the factorial function.")