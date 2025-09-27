import random

def factorial(n):
    """Calculate the factorial of a non-negative integer n."""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

# Generate a random filename
random_filename = f"factorial_impl_{random.randint(1000, 9999)}.py"

# Write the function definition to the random file
with open(random_filename, 'w') as f:
    f.write('''def factorial(n):
    """Calculate the factorial of a non-negative integer n."""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result
''')

print(f"Factorial function written to {random_filename}")
