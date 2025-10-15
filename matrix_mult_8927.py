import numpy as np

def matrix_multiplication_demo():
    """
    Demonstrates matrix multiplication using NumPy
    """
    print("Matrix Multiplication using NumPy")
    print("=" * 35)
    
    # Create two random matrices
    matrix_a = np.array([[1, 2, 3],
                         [4, 5, 6]])
    
    matrix_b = np.array([[7, 8],
                         [9, 10],
                         [11, 12]])
    
    print("Matrix A:")
    print(matrix_a)
    print("\nMatrix B:")
    print(matrix_b)
    
    # Perform matrix multiplication using np.dot()
    result = np.dot(matrix_a, matrix_b)
    
    print("\nResult of A × B:")
    print(result)
    
    # Alternative ways to perform matrix multiplication
    result_alt = matrix_a @ matrix_b  # Using @ operator (Python 3.5+)
    print("\nUsing @ operator:")
    print(result_alt)
    
    # Verify both methods give the same result
    print(f"\nBoth methods give same result: {np.array_equal(result, result_alt)}")
    
    # Demonstrate with random matrices of specified dimensions
    print("\n" + "=" * 35)
    print("Random matrices example:")
    
    # Create random matrices
    rand_matrix_1 = np.random.randint(1, 10, size=(3, 4))
    rand_matrix_2 = np.random.randint(1, 10, size=(4, 2))
    
    print("Random Matrix 1 (3x4):")
    print(rand_matrix_1)
    print("\nRandom Matrix 2 (4x2):")
    print(rand_matrix_2)
    
    rand_result = np.dot(rand_matrix_1, rand_matrix_2)
    print("\nResult of multiplication (3x2):")
    print(rand_result)

if __name__ == "__main__":
    matrix_multiplication_demo()