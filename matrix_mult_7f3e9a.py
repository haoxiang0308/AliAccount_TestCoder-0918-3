import numpy as np

def matrix_multiply_demo():
    # Create two random matrices
    matrix_a = np.random.rand(3, 3)
    matrix_b = np.random.rand(3, 3)
    
    # Perform matrix multiplication
    result = np.dot(matrix_a, matrix_b)
    
    # Display the results
    print("Matrix A:")
    print(matrix_a)
    print("\nMatrix B:")
    print(matrix_b)
    print("\nResult of A × B:")
    print(result)
    
    # Demonstrate element-wise multiplication for comparison
    elementwise_result = matrix_a * matrix_b
    print("\nElement-wise multiplication of A and B (for comparison):")
    print(elementwise_result)

if __name__ == "__main__":
    matrix_multiply_demo()