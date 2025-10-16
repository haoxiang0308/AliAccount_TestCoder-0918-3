# Julia script for basic array operations

# Define a sample array
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println("Original array: ", arr)

# Calculate the sum of the array
array_sum = sum(arr)
println("Sum of array elements: ", array_sum)

# Calculate the mean of the array
array_mean = mean(arr)
println("Mean of array elements: ", array_mean)

# Additional operations
array_length = length(arr)
println("Length of array: ", array_length)

array_max = maximum(arr)
println("Maximum value: ", array_max)

array_min = minimum(arr)
println("Minimum value: ", array_min)

# Create another array for demonstration
arr2 = [2.5, 3.7, 1.2, 8.9, 5.1]

println("\nSecond array: ", arr2)

# Sum and mean for the second array
sum2 = sum(arr2)
mean2 = mean(arr2)

println("Sum of second array: ", sum2)
println("Mean of second array: ", mean2)

# Using a function to demonstrate reusability
function calculate_stats(input_array)
    println("\n--- Statistics for provided array ---")
    println("Array: ", input_array)
    println("Sum: ", sum(input_array))
    println("Mean: ", mean(input_array))
    println("Length: ", length(input_array))
    println("Max: ", maximum(input_array))
    println("Min: ", minimum(input_array))
end

# Test the function with a random array
random_arr = rand(1:100, 5)  # Generate 5 random integers between 1 and 100
calculate_stats(random_arr)