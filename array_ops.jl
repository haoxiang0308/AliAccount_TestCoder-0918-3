# array_ops.jl - Basic Array Operations in Julia

# Define an example array
numbers = [10, 20, 30, 40, 50]

println("Original array: ", numbers)

# Calculate the sum
array_sum = sum(numbers)
println("Sum of array elements: ", array_sum)

# Calculate the mean
array_mean = mean(numbers)
println("Mean of array elements: ", array_mean)

# Demonstrate with a different array
other_numbers = [1.5, 2.7, 3.2, 4.8, 5.1]
println("\nAnother array: ", other_numbers)
println("Sum: ", sum(other_numbers))
println("Mean: ", mean(other_numbers))