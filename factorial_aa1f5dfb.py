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
    # Check if input is an integer
    if not isinstance(n, int):
        raise TypeError("Input must be an integer")
    
    # Check if input is non-negative
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    
    # Base case
    if n == 0 or n == 1:
        return 1
    
    # Calculate factorial iteratively
    result = 1
    for i in range(2, n + 1):
        result *= i
    
    return result


# Example usage
if __name__ == "__main__":
    # Test the function
    test_values = [0, 1, 5, 10]
    for val in test_values:
        print(f"{val}! = {factorial(val)}")