def factorial(n):
    """Calculates the factorial of a non-negative integer n."""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    if n == 0 or n == 1:
        return 1
    result = n * factorial(n - 1)
    return result

# Example usage:
# print(factorial(5))  # Output: 120