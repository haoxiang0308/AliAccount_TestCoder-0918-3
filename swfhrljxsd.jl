# Julia script for basic array operations

using Statistics

# Define a function to calculate sum of array elements
function calculate_sum(arr)
    return sum(arr)
end

# Define a function to calculate mean of array elements
function calculate_mean(arr)
    return mean(arr)
end

# Example array
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Calculate sum and mean
total = calculate_sum(numbers)
avg = calculate_mean(numbers)

println("Array: ", numbers)
println("Sum: ", total)
println("Mean: ", avg)

# Additional example with different array
random_numbers = [2.5, 4.7, 1.2, 8.9, 5.3]
println("\nAnother Array: ", random_numbers)
println("Sum: ", calculate_sum(random_numbers))
println("Mean: ", calculate_mean(random_numbers))