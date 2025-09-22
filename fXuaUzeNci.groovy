// Groovy script demonstrating a closure for filtering lists
// Filename: fXuaUzeNci.groovy

// Define a list of numbers
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// Create a closure that filters even numbers
def evenFilter = { it % 2 == 0 }

// Apply the filter closure to the list
def evenNumbers = numbers.findAll(evenFilter)

// Print the results
println "Original list: $numbers"
println "Even numbers: $evenNumbers"

// Another example with strings
def words = ["apple", "banana", "cherry", "date", "elderberry"]

// Create a closure that filters words longer than 5 characters
def longWordFilter = { it.length() > 5 }

// Apply the filter closure to the list of words
def longWords = words.findAll(longWordFilter)

// Print the string filtering results
println "\nOriginal words: $words"
println "Long words: $longWords"

// Example of a parameterized closure
def createRangeFilter(min, max) {
    return { it >= min && it <= max }
}

// Use the parameterized closure
def inRangeFilter = createRangeFilter(3, 7)
def rangeNumbers = numbers.findAll(inRangeFilter)

println "\nNumbers in range 3-7: $rangeNumbers"