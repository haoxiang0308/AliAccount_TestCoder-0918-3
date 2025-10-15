#!/usr/bin/env groovy

// Define a sample list
def items = ['apple', 'banana', 'cherry', 'date', 'elderberry']

// Iterate over the list and print each item
items.each { item ->
    println item
}

// Alternative syntax using for loop
println "\nUsing for loop:"
for (item in items) {
    println item
}