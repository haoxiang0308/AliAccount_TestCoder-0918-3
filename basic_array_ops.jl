# Julia script for basic array operations

# Define an example array
arr = [1, 2, 3, 4, 5]

# Calculate the sum
sum_result = sum(arr)
println("Sum of the array: ", sum_result)

# Calculate the mean
mean_result = mean(arr)
println("Mean of the array: ", mean_result)

# Perform operations on a 2D array
matrix = [1 2; 3 4]
println("2D Array (Matrix):")
display(matrix)
println("Sum of the 2D array: ", sum(matrix))
println("Mean of the 2D array: ", mean(matrix))