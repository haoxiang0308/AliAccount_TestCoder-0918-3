#!/usr/bin/env ruby

# Create an example array
array = [1, 2, 3, 4, 5, 'hello', 'world', 10.5]

# Using each block to iterate through the array and print elements
puts "Iterating through array using a block:"
array.each do |element|
  puts element
end

# Alternative syntax using curly braces
puts "\nUsing alternative syntax with curly braces:"
fruits = ['apple', 'banana', 'cherry']
fruits.each { |fruit| puts fruit }