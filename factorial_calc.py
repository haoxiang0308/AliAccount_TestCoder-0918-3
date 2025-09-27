def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.

    Args:
        n: A non-negative integer.

    Returns:
        The factorial of n (n!), which is the product of all positive integers less than or equal to n.
        For n = 0, it returns 1 by definition.

    Raises:
        ValueError: If n is negative.
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

# Example usage:
if __name__ == "__main__":
    print(f"The factorial of 6 is {factorial(6)}")
    print(f"The factorial of 0 is {factorial(0)}")