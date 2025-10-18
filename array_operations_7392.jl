# Julia script for basic array operations

using Statistics

# Define an example array
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println("Original array: ", arr)

# Calculate the sum of the array
array_sum = sum(arr)
println("Sum of array elements: ", array_sum)

# Calculate the mean of the array
array_mean = mean(arr)
println("Mean of array elements: ", array_mean)

# Additional array operations
array_length = length(arr)
println("Length of array: ", array_length)

array_maximum = maximum(arr)
println("Maximum value in array: ", array_maximum)

array_minimum = minimum(arr)
println("Minimum value in array: ", array_minimum)

# Create another array for demonstration
arr2 = [2, 4, 6, 8, 10]

println("\nSecond array: ", arr2)
println("Sum of second array: ", sum(arr2))
println("Mean of second array: ", mean(arr2))

# Element-wise operations
println("\nAdding arrays element-wise: ", arr[1:5] .+ arr2)
println("Multiplying first array by 2: ", arr .* 2)