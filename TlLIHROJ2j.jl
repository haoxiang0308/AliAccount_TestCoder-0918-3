# Julia script for basic array operations

# Function to calculate sum of an array
function calculate_sum(arr)
    return sum(arr)
end

# Function to calculate mean of an array
function calculate_mean(arr)
    return mean(arr)
end

# Function to demonstrate various array operations
function array_operations_demo()
    # Create a sample array
    arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    println("Original array: ", arr)
    
    # Calculate sum
    arr_sum = calculate_sum(arr)
    println("Sum of array: ", arr_sum)
    
    # Calculate mean
    arr_mean = calculate_mean(arr)
    println("Mean of array: ", arr_mean)
    
    # Additional operations
    arr_max = maximum(arr)
    arr_min = minimum(arr)
    arr_length = length(arr)
    
    println("Maximum value: ", arr_max)
    println("Minimum value: ", arr_min)
    println("Length of array: ", arr_length)
    
    # Create another array for more operations
    arr2 = [2, 4, 6, 8, 10]
    println("\nSecond array: ", arr2)
    
    # Sum of second array
    sum2 = calculate_sum(arr2)
    println("Sum of second array: ", sum2)
    
    # Mean of second array
    mean2 = calculate_mean(arr2)
    println("Mean of second array: ", mean2)
    
    # Element-wise operations
    squared_arr = arr .^ 2
    println("\nSquared elements of first array: ", squared_arr)
    
    # Array concatenation
    concatenated = vcat(arr, arr2)
    println("Concatenated array: ", concatenated)
end

# Import Statistics module for mean function
using Statistics

# Run the demo
array_operations_demo()