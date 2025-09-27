#!/usr/bin/env julia

# Define a sample array
arr = [1, 2, 3, 4, 5]

# Calculate the sum
total = sum(arr)
println("Sum of the array: ", total)

# Calculate the mean
avg = mean(arr)
println("Mean of the array: ", avg)

# Perform operations on a 2D array
matrix = [1 2; 3 4]
println("Original 2D array:")
display(matrix)

# Sum of all elements in the 2D array
matrix_sum = sum(matrix)
println("Sum of all elements in the 2D array: ", matrix_sum)

# Mean of all elements in the 2D array
matrix_mean = mean(matrix)
println("Mean of all elements in the 2D array: ", matrix_mean)
