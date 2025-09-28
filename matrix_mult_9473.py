import numpy as np

# Define two matrices
A = np.array([[1, 2, 3], [4, 5, 6]])
B = np.array([[7, 8], [9, 10], [11, 12]])

# Perform matrix multiplication
C = np.dot(A, B)
# Alternatively, you can use the @ operator
# C = A @ B

print("Matrix A:")
print(A)
print("
Matrix B:")
print(B)
print("
Result of A * B:")
print(C)
