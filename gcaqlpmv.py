import numpy as np

# Create two random matrices
matrix_a = np.random.rand(3, 4)
matrix_b = np.random.rand(4, 2)

print('Matrix A (3x4):')
print(matrix_a)
print()
print('Matrix B (4x2):')
print(matrix_b)
print()

# Perform matrix multiplication
result = np.dot(matrix_a, matrix_b)
# Alternative: result = matrix_a @ matrix_b

print('Result of matrix multiplication (A * B):')
print(result)
print()
print(f'Shape of result: {result.shape}')
