# Julia script for basic array operations
# This script demonstrates sum and mean operations on arrays

# Define a sample array
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println("Original array: ", arr)

# Calculate the sum of the array
array_sum = sum(arr)
println("Sum of array elements: ", array_sum)

# Calculate the mean of the array
array_mean = mean(arr)
println("Mean of array elements: ", array_mean)

# Perform operations on a 2D array as well
matrix = [1 2 3; 4 5 6; 7 8 9]
println("\nOriginal matrix:")
display(matrix)

# Sum of all elements in the matrix
matrix_sum = sum(matrix)
println("Sum of all matrix elements: ", matrix_sum)

# Mean of all elements in the matrix
matrix_mean = mean(matrix)
println("Mean of all matrix elements: ", matrix_mean)

# Sum along each column (dimension 1)
column_sums = sum(matrix, dims=1)
println("Sum along each column: ", column_sums)

# Sum along each row (dimension 2)
row_sums = sum(matrix, dims=2)
println("Sum along each row: ", row_sums)

# Additional example with random numbers
println("\nExample with random numbers:")
random_arr = rand(1:100, 10)  # Generate 10 random integers between 1 and 100
println("Random array: ", random_arr)
println("Sum of random array: ", sum(random_arr))
println("Mean of random array: ", mean(random_arr))