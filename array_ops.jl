# array_ops.jl
# This script demonstrates basic array operations in Julia.

# Define a sample array
data = [10, 20, 30, 40, 50]

println("Original array: ", data)

# Calculate the sum of the array elements
array_sum = sum(data)
println("Sum of array elements: ", array_sum)

# Calculate the mean of the array elements
array_mean = mean(data)
println("Mean of array elements: ", array_mean)

println("Script execution completed.")