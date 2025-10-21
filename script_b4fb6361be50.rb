# Ruby script to iterate through an array using blocks
my_array = ['apple', 'banana', 'cherry', 'date', 'elderberry']

puts 'Iterating through array using each block:'
my_array.each do |element|
  puts element
end

puts "\nUsing map block:"
my_array.map { |element| puts "Processing: #{element}" }

puts "\nUsing select block:"
elements_with_a = my_array.select { |element| element.include?('a') }
puts "Elements containing 'a': #{elements_with_a}"