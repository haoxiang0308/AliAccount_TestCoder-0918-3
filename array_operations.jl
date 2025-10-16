# Julia script for basic array operations
# This script demonstrates sum and mean operations on arrays

using Statistics  # Required for mean, std, etc.

println("Basic Array Operations in Julia")
println("="^30)

# Create sample arrays
arr1 = [1, 2, 3, 4, 5]
arr2 = [10.0, 20.0, 30.0, 40.0, 50.0]
arr3 = rand(1:100, 10)  # Random array of 10 integers between 1 and 100

println("Array 1: ", arr1)
println("Sum of Array 1: ", sum(arr1))
println("Mean of Array 1: ", mean(arr1))
println()

println("Array 2: ", arr2)
println("Sum of Array 2: ", sum(arr2))
println("Mean of Array 2: ", mean(arr2))
println()

println("Random Array 3: ", arr3)
println("Sum of Array 3: ", sum(arr3))
println("Mean of Array 3: ", mean(arr3))
println()

# Additional array operations
println("Additional Operations:")
println("Maximum value in Array 3: ", maximum(arr3))
println("Minimum value in Array 3: ", minimum(arr3))
println("Length of Array 3: ", length(arr3))
println("Sorted Array 3: ", sort(arr3))

# Using anonymous functions with arrays
println("\nUsing anonymous functions:")
println("Square of each element in Array 1: ", map(x -> x^2, arr1))
println("Elements in Array 2 greater than 25: ", filter(x -> x > 25, arr2))

# Matrix operations
println("\nMatrix Operations:")
matrix = [1 2 3; 4 5 6; 7 8 9]
println("Matrix: \n", matrix)
println("Sum of all elements in matrix: ", sum(matrix))
println("Mean of all elements in matrix: ", mean(matrix))

# Sum and mean along specific dimensions
println("Column-wise sums: ", sum(matrix, dims=1))
println("Row-wise sums: ", sum(matrix, dims=2))
println("Column-wise means: ", mean(matrix, dims=1))
println("Row-wise means: ", mean(matrix, dims=2))