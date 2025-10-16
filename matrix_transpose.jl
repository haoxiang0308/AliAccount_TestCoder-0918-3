# Create a matrix and perform transpose operation

# Create a 3x3 matrix
A = [1 2 3; 4 5 6; 7 8 9]

println("Original matrix A:")
display(A)

# Perform transpose operation
A_transpose = transpose(A)
# Alternative syntax: A_transpose = A'

println("\nTransposed matrix A':")
display(A_transpose)

# Create another example with a non-square matrix
B = [1 2 3 4; 5 6 7 8]

println("\nOriginal matrix B:")
display(B)

B_transpose = B'

println("\nTransposed matrix B':")
display(B_transpose)