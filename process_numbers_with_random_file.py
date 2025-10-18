import random
import string

def process_numbers(numbers):
    """Process a list of numbers by squaring them, filtering even squares, and summing them."""
    squares = [x * x for x in numbers]
    even_squares = [x for x in squares if x % 2 == 0]
    result = sum(even_squares)
    return result, squares, even_squares

def generate_random_filename(extension=".txt"):
    """Generate a random filename with the given extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}{extension}"

# Example list of numbers to process
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Process the numbers
result, squares, even_squares = process_numbers(numbers)

# Generate random filename
filename = generate_random_filename()

# Save the result to the file
content = f"Original numbers: {numbers}\nSquares: {squares}\nEven squares: {even_squares}\nSum of even squares: {result}"
with open(filename, 'w') as f:
    f.write(content)

print(f"Processed numbers: {numbers}")
print(f"Squares: {squares}")
print(f"Even squares: {even_squares}")
print(f"Sum of even squares: {result}")
print(f"Data saved to file: {filename}")