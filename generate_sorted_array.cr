# Generate an array, sort it, and save to a file with a random name

# Create an array with random integers
array = [] of Int32
10.times do
  array << rand(1..100)
end

puts "Original array: #{array}"

# Sort the array
sorted_array = array.sort
puts "Sorted array: #{sorted_array}"

# Generate a random filename
random_filename = "sorted_array_#{rand(UInt32)}.txt"

# Write the sorted array to the file
File.write(random_filename, sorted_array.join(", ") + "\n")

puts "Sorted array saved to: #{random_filename}"