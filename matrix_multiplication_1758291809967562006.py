import numpy as np

def matrix_multiplication_example():
    # Create two random matrices
    matrix_a = np.random.rand(3, 3)
    matrix_b = np.random.rand(3, 3)
    
    # Perform matrix multiplication using np.dot()
    result_dot = np.dot(matrix_a, matrix_b)
    
    # Perform matrix multiplication using @ operator (Python 3.5+)
    result_at = matrix_a @ matrix_b
    
    # Perform matrix multiplication using np.matmul()
    result_matmul = np.matmul(matrix_a, matrix_b)
    
    print("Matrix A:")
    print(matrix_a)
    print("\nMatrix B:")
    print(matrix_b)
    print("\nResult using np.dot():")
    print(result_dot)
    print("\nResult using @ operator:")
    print(result_at)
    print("\nResult using np.matmul():")
    print(result_matmul)
    
    # Verify that all methods produce the same result
    print("\nAll methods produce the same result:", 
          np.allclose(result_dot, result_at) and np.allclose(result_at, result_matmul))

if __name__ == "__main__":
    matrix_multiplication_example()