import numpy as np

def matrix_multiply_demo():
    # Create two random matrices
    A = np.random.rand(3, 4)
    B = np.random.rand(4, 3)
    
    # Perform matrix multiplication
    C = np.dot(A, B)
    
    # Display the results
    print("Matrix A (3x4):")
    print(A)
    print("\nMatrix B (4x3):")
    print(B)
    print("\nMatrix C = A × B (3x3):")
    print(C)
    
    # Verify the dimensions
    print(f"\nDimensions:")
    print(f"A: {A.shape}")
    print(f"B: {B.shape}")
    print(f"C: {C.shape}")

if __name__ == "__main__":
    matrix_multiply_demo()