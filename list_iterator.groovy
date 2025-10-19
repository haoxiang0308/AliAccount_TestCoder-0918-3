// Groovy script to iterate over a list and print each item
def items = ['apple', 'banana', 'cherry', 'date', 'elderberry']

println "Iterating over the list:"
items.each { item ->
    println item
}

println "\nUsing for loop:"
for (item in items) {
    println item
}