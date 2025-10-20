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
function find_maximum(arr)
    return maximum(arr)
end

# Function to calculate minimum value in array
function find_minimum(arr)
    return minimum(arr)
end

# Function to calculate standard deviation
function calculate_std(arr)
    n = length(arr)
    mean_val = calculate_mean(arr)
    variance = sum((x - mean_val)^2 for x in arr) / n
    return sqrt(variance)
end

# Main execution
println("Basic Array Operations in Julia")

# Create a sample array
sample_array = [1, 5, 3, 9, 2, 8, 4, 7, 6]

println("Original array: ", sample_array)

# Perform operations
println("Sum: ", calculate_sum(sample_array))
println("Mean: ", calculate_mean(sample_array))
println("Maximum: ", find_maximum(sample_array))
println("Minimum: ", find_minimum(sample_array))
println("Standard Deviation: ", calculate_std(sample_array))

# Test with another array
another_array = [10, 20, 30, 40, 50]
println("\nAnother array: ", another_array)
println("Sum: ", calculate_sum(another_array))
println("Mean: ", calculate_mean(another_array))
println("Maximum: ", find_maximum(another_array))
println("Minimum: ", find_minimum(another_array))
println("Standard Deviation: ", calculate_std(another_array))