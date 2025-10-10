# A Python function to calculate the factorial of a number
# File generated randomly

def factorial(n):
    """Calculate the factorial of a non-negative integer n."""
    if n < 0:
        raise ValueError('Factorial is not defined for negative numbers.')
    if n == 0 or n == 1:
        return 1
    return n * factorial(n - 1)
