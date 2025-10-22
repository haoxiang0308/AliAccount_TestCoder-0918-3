# Ruby script to iterate through an array using a block

# Define an example array
fruits = ["orange", "grape", "kiwi", "peach", "mango"]

puts "Fruits in the array:"
fruits.each do |fruit|
  puts "- #{fruit}"
end

# Numeric array example
numbers = [10, 20, 30, 40, 50]
puts "\nNumbers multiplied by 2:"
numbers.each { |num| puts "#{num} * 2 = #{num * 2}" }