# Basic Array Operations in Julia

# Create a sample array
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Calculate the sum of the array
sum_result = sum(arr)
println("Sum of array: $sum_result")

# Calculate the mean of the array
mean_result = mean(arr)
println("Mean of array: $mean_result")

# Additional operations
println("Length of array: $(length(arr))")
println("Maximum value: $(maximum(arr))")
println("Minimum value: $(minimum(arr))")

# Create a 2D array
matrix = [1 2 3; 4 5 6; 7 8 9]
println("2D Array:")
println(matrix)

# Sum of all elements in 2D array
matrix_sum = sum(matrix)
println("Sum of 2D array: $matrix_sum")

# Mean of all elements in 2D array
matrix_mean = mean(matrix)
println("Mean of 2D array: $matrix_mean")