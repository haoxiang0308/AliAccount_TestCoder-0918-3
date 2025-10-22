# Create a matrix
matrix = [1 2 3; 4 5 6; 7 8 9]

println("Original matrix:")
display(matrix)

# Transpose the matrix
transposed_matrix = transpose(matrix)

println("\nTransposed matrix:")
display(transposed_matrix)

# Alternative syntax for transpose
transposed_matrix_alt = matrix'  # Using the prime operator

println("\nTransposed matrix using prime operator:")
display(transposed_matrix_alt)