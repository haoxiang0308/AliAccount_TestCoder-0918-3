# array_operations.jl
# This script performs basic array operations like sum and mean.

# Define a sample array
arr = [10, 20, 30, 40, 50]

println("Original Array: ", arr)

# Calculate the sum of the array elements
sum_result = sum(arr)
println("Sum of elements: ", sum_result)

# Calculate the mean of the array elements
mean_result = sum_result / length(arr) # Manual calculation
# Alternatively, you can use the built-in mean function if Statistics is imported:
# using Statistics
# mean_result_builtin = mean(arr)
println("Mean of elements (manual calculation): ", mean_result)

# Find the maximum and minimum values
max_val = maximum(arr)
min_val = minimum(arr)
println("Maximum value: ", max_val)
println("Minimum value: ", min_val)

println("Script execution completed.")