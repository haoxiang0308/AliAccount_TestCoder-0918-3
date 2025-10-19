import random
import string

def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

def generate_random_filename(extension=".py"):
    """Generate a random filename."""
    letters = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(letters) for _ in range(10))
    return f"{random_name}{extension}"

def save_factorial_function_to_random_file():
    """Save the factorial function to a randomly named file."""
    # Generate the code content
    code_content = '''def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result
'''
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the code to the random file
    with open(random_filename, 'w') as file:
        file.write(code_content)
    
    print(f"Factorial function saved to {random_filename}")
    return random_filename

if __name__ == "__main__":
    save_factorial_function_to_random_file()