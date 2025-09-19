import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.py'
    return filename

def factorial(n):
    """Calculate the factorial of a number"""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

# Generate random filename
filename = generate_random_filename()
print(f"Random filename: {filename}")

# Save the factorial function to the file
with open(filename, 'w') as f:
    f.write('''
def factorial(n):
    """Calculate the factorial of a number"""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

if __name__ == "__main__":
    # Test the function
    num = 5
    print(f"Factorial of {num} is {factorial(num)}")
''')

print(f"Factorial function saved to {filename}")