#!/usr/bin/env ruby

# Define an array of elements
elements = ["apple", "banana", "cherry", "date", "elderberry"]

# Using each block to iterate through the array and print elements
puts "Using 'each' block to iterate through the array:"
elements.each do |element|
  puts element
end

puts "\nUsing 'each' block with a different approach:"
elements.each { |item| puts "Item: #{item}" }

# Additional example with numbers
numbers = [1, 2, 3, 4, 5]
puts "\nIterating through numbers:"
numbers.each do |num|
  puts "Number: #{num}"
end