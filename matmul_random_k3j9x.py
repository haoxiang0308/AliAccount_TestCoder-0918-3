import numpy as np

# Create two matrices
matrix_a = np.array([[1, 2, 3],
                     [4, 5, 6]])

matrix_b = np.array([[7, 8],
                     [9, 10],
                     [11, 12]])

# Perform matrix multiplication using @ operator (Python 3.5+)
result = matrix_a @ matrix_b

print("Matrix A:")
print(matrix_a)
print("\nMatrix B:")
print(matrix_b)
print("\nResult of A @ B:")
print(result)

# Verify with np.matmul()
result2 = np.matmul(matrix_a, matrix_b)
print("\nVerification with np.matmul():")
print(result2)
print(f"\nAre the results equal? {np.array_equal(result, result2)}")