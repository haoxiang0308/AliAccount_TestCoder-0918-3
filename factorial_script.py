import random
import string

def generate_random_filename(ext="py"):
    """Generates a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.{ext}"

def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.

    Args:
        n (int): A non-negative integer.

    Returns:
        int: The factorial of n.

    Raises:
        ValueError: If n is negative.
        TypeError: If n is not an integer.
    """
    if not isinstance(n, int):
        raise TypeError("Input must be an integer.")
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")

    if n == 0 or n == 1:
        return 1
    else:
        result = 1
        for i in range(2, n + 1):
            result *= i
        return result

if __name__ == "__main__":
    # Example usage
    try:
        num = 5
        print(f"The factorial of {num} is {factorial(num)}")
    except (ValueError, TypeError) as e:
        print(f"Error: {e}")

    # Generate a random filename and save the function
    random_filename = generate_random_filename()
    with open(random_filename, 'w') as f:
        f.write('# Factorial Function\n\n')
        f.write(factorial.__code__.co_consts[0] or '""""""\n') # This won't work for saving the source code
        import inspect
        f.write(inspect.getsource(factorial))

    print(f"Factorial function saved to {random_filename}")
