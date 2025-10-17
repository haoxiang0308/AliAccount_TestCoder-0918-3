import numpy as np
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}.py"

def perform_matrix_multiplication():
    """Perform matrix multiplication using NumPy."""
    # Create two random matrices
    matrix_a = np.random.randint(1, 10, size=(3, 3))
    matrix_b = np.random.randint(1, 10, size=(3, 3))
    
    print("Matrix A:")
    print(matrix_a)
    print("\nMatrix B:")
    print(matrix_b)
    
    # Perform matrix multiplication
    result = np.dot(matrix_a, matrix_b)
    # Alternative: result = matrix_a @ matrix_b
    
    print("\nResult of A * B:")
    print(result)
    
    return matrix_a, matrix_b, result

def save_script_to_random_file():
    """Save this script to a randomly named .py file."""
    # Generate the content of the script that will be saved
    script_content = '''import numpy as np

def main():
    # Create two random matrices
    matrix_a = np.random.randint(1, 10, size=(3, 3))
    matrix_b = np.random.randint(1, 10, size=(3, 3))
    
    print("Matrix A:")
    print(matrix_a)
    print("\\nMatrix B:")
    print(matrix_b)
    
    # Perform matrix multiplication
    result = np.dot(matrix_a, matrix_b)
    
    print("\\nResult of A * B:")
    print(result)

if __name__ == "__main__":
    main()
'''
    
    random_filename = generate_random_filename()
    
    # Write the script to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Matrix multiplication script saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    print("Performing matrix multiplication...")
    perform_matrix_multiplication()
    
    print("\nGenerating a new script file with random name...")
    save_script_to_random_file()