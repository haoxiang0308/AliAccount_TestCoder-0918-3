import numpy as np

# Create two random matrices
A = np.random.rand(3, 4)
B = np.random.rand(4, 2)

print('Matrix A (3x4):')
print(A)
print()
print('Matrix B (4x2):')
print(B)
print()

# Perform matrix multiplication
result = np.dot(A, B)
# Alternative: result = A @ B

print('Result of A * B (3x2):')
print(result)
