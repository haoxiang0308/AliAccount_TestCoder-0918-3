# Julia script for basic array operations

# Function to calculate sum of array elements
function calculate_sum(arr)
    return sum(arr)
end

# Function to calculate mean of array elements
function calculate_mean(arr)
    return sum(arr) / length(arr)
end

# Function to calculate maximum value in array
function calculate_max(arr)
    return maximum(arr)
end

# Function to calculate minimum value in array
function calculate_min(arr)
    return minimum(arr)
end

# Function to calculate standard deviation
function calculate_std(arr)
    n = length(arr)
    mean_val = calculate_mean(arr)
    variance = sum((x - mean_val)^2 for x in arr) / n
    return sqrt(variance)
end

# Example usage
println("Basic Array Operations in Julia")
println("--------------------------------")

# Create a sample array
sample_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
println("Sample array: ", sample_array)

# Calculate and display results
println("Sum: ", calculate_sum(sample_array))
println("Mean: ", calculate_mean(sample_array))
println("Max: ", calculate_max(sample_array))
println("Min: ", calculate_min(sample_array))
println("Standard Deviation: ", calculate_std(sample_array))

# Another example with different numbers
println("\nAnother example:")
another_array = [2.5, 4.7, 1.2, 8.9, 3.3]
println("Sample array: ", another_array)
println("Sum: ", calculate_sum(another_array))
println("Mean: ", calculate_mean(another_array))
println("Max: ", calculate_max(another_array))
println("Min: ", calculate_min(another_array))
println("Standard Deviation: ", calculate_std(another_array))