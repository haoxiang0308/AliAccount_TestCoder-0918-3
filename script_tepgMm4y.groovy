#!/usr/bin/env groovy

// Define a list of items
def items = ["apple", "banana", "cherry", "date", "elderberry"]

// Iterate over the list and print each item
items.each { item ->
    println "Item: ${item}"
}

// Alternative way to iterate with index
println "\nWith index:"
items.eachWithIndex { item, index ->
    println "Item ${index}: ${item}"
}