#!/usr/bin/env ruby

# Create an array of random elements
fruits = ["orange", "grape", "kiwi", "peach", "mango"]

# Using different block methods to iterate through the array
puts "Using .each method:"
fruits.each do |fruit|
  puts "Fruit: #{fruit}"
end

puts "\nUsing .each_with_index method:"
fruits.each_with_index do |fruit, index|
  puts "#{index + 1}. #{fruit}"
end

# Using a range with a block
puts "\nUsing range with block:"
(1..3).each { |i| puts "Count: #{i}" }

# Using map to transform elements
puts "\nUsing map to transform elements:"
capitalized_fruits = fruits.map { |fruit| fruit.capitalize }
capitalized_fruits.each { |fruit| puts fruit }