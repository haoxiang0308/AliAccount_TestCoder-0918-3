# Ruby script to iterate through an array using a block

# Define an example array
my_array = ["apple", "banana", "cherry", "date", "elderberry"]

puts "Iterating through array using a block:"
my_array.each do |element|
  puts element
end

# Additional example with numbers
puts "\nNumbers:"
(1..5).each { |num| puts num }