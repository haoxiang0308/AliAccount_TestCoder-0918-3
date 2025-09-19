import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"selenium_test_{random_string}.py"

# Generate and print a random filename
random_filename = generate_random_filename()
print(f"Random filename generated: {random_filename}")