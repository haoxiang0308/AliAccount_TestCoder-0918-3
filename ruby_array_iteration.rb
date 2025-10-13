# Ruby block example to iterate over an array and print elements

arr = [1, 2, 3, 4, 5]

puts "Iterating over the array using a block:"
arr.each do |element|
  puts element
end

puts "\nUsing a block with index:"
arr.each_with_index do |element, index|
  puts "Index: #{index}, Value: #{element}"
end