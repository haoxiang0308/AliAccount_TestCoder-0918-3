#!/usr/bin/env ruby

# Array to iterate through
array = [1, 2, 3, 4, 5, 'hello', 'world', 10.5]

# Using each block to iterate and print elements
puts "Using 'each' block:"
array.each do |element|
  puts element
end

puts "\nUsing 'each' block with curly braces:"
array.each { |element| puts element }

puts "\nUsing 'each_with_index' block:"
array.each_with_index do |element, index|
  puts "Index #{index}: #{element}"
end

puts "\nUsing 'map' block:"
doubled = array.select { |element| element.is_a?(Numeric) }.map { |element| element * 2 }
puts "Doubled numeric values: #{doubled}"