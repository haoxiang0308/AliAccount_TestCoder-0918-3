#!/usr/bin/env ruby

# Ruby script demonstrating block iteration through an array
# Using different methods to iterate with blocks and print elements

# Define an array of sample elements
array = ["apple", "banana", "cherry", "date", "elderberry"]

puts "Original array: #{array}"

puts "\nUsing .each block to iterate through array:"
array.each do |element|
  puts "Element: #{element}"
end

puts "\nUsing .each_with_index block:"
array.each_with_index do |element, index|
  puts "Index #{index}: #{element}"
end

puts "\nUsing .map block to transform and print:"
doubled_elements = array.map do |element|
  element * 2  # duplicate the string
end
puts "Doubled elements: #{doubled_elements}"

puts "\nUsing curly braces syntax:"
array.each { |element| puts "Item: #{element}" }

# Numeric array example
numbers = [1, 2, 3, 4, 5]

puts "\nNumeric array: #{numbers}"
puts "Using block to print squared values:"
numbers.each { |num| puts "#{num} squared is #{num ** 2}" }