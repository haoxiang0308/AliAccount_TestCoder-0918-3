import random
import string

def factorial(n):
    """Calculates the factorial of a non-negative integer n."""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

# Generate a random filename
random_filename = "factorial_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"

# Write the function to the randomly named file
with open(random_filename, 'w') as f:
    f.write('''def factorial(n):
    """Calculates the factorial of a non-negative integer n."""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result
''')

print(f"The factorial function has been saved to {random_filename}")
