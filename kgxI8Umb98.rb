#!/usr/bin/env ruby

# Ruby script to demonstrate iterating through an array using blocks and printing elements

# Define an array of elements
fruits = ["apple", "banana", "orange", "grape", "kiwi"]

puts "Using each block to iterate through the array:"
# Using the each method with a block to iterate through the array
fruits.each do |fruit|
  puts fruit
end

puts "\nUsing each_with_index block to iterate with index:"
# Using each_with_index to get both index and value
fruits.each_with_index do |fruit, index|
  puts "#{index + 1}. #{fruit}"
end

puts "\nUsing a range with a block:"
# Using a range with a block
(1..5).each do |number|
  puts "Number: #{number}"
end

puts "\nUsing map to transform elements:"
# Using map to transform elements
uppercase_fruits = fruits.map do |fruit|
  fruit.upcase
end
puts uppercase_fruits.join(", ")

puts "\nUsing select to filter elements:"
# Using select to filter elements
long_name_fruits = fruits.select do |fruit|
  fruit.length > 5
end
puts long_name_fruits.join(", ")