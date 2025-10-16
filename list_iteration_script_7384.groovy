#!/usr/bin/env groovy

// Define a sample list
def myList = ['apple', 'banana', 'cherry', 'date', 'elderberry']

// Iterate over the list and print each item
myList.each { item ->
    println item
}

// Alternative approach using for loop
println "\nUsing for loop:"
for (item in myList) {
    println item
}