def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.

    Args:
        n: A non-negative integer.

    Returns:
        The factorial of n (n!).

    Raises:
        ValueError: If n is negative.
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    if n == 0 or n == 1:
        return 1
    result = n * factorial(n - 1)
    return result

# Example usage:
# print(factorial(5))  # Output: 120