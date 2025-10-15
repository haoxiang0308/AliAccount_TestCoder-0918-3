# Matrix creation and transpose operation

# Original Matrix:
matrix = [1 2 3; 4 5 6; 7 8 9]

# Transposed Matrix:
transposed_matrix = [1 4 7; 2 5 8; 3 6 9]

# Alternative way to transpose:
matrix_t = matrix'  # Using the ' operator
println("Original Matrix:\n", matrix)
println("Transposed Matrix:\n", transposed_matrix)
println("Using operator (' ):\n", matrix_t)
