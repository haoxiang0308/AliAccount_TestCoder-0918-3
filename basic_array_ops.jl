# Julia script for basic array operations

# Define an example array
arr = [1, 2, 3, 4, 5]

# Calculate the sum
array_sum = sum(arr)
println("Sum of the array: ", array_sum)

# Calculate the mean
array_mean = mean(arr)
println("Mean of the array: ", array_mean)

# Perform operations on a different array
arr2 = [10.0, 20.0, 30.0, 40.0, 50.0]
println("\nFor a second array [10.0, 20.0, 30.0, 40.0, 50.0]:")
println("Sum: ", sum(arr2))
println("Mean: ", mean(arr2))