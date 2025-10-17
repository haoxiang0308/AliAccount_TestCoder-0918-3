import numpy as np

def main():
    # Create two random matrices
    matrix_a = np.random.randint(1, 10, size=(3, 3))
    matrix_b = np.random.randint(1, 10, size=(3, 3))
    
    print("Matrix A:")
    print(matrix_a)
    print("\nMatrix B:")
    print(matrix_b)
    
    # Perform matrix multiplication
    result = np.dot(matrix_a, matrix_b)
    
    print("\nResult of A * B:")
    print(result)

if __name__ == "__main__":
    main()
