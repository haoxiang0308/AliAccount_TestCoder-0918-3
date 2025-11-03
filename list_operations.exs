# Create a list in Elixir
original_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

# Filter the list to get only even numbers
filtered_list = Enum.filter(original_list, fn x -> rem(x, 2) == 0 end)

# Map the filtered list to square each number
mapped_list = Enum.map(filtered_list, fn x -> x * x end)

# Print the results
IO.puts("Original list: #{inspect(original_list)}")
IO.puts("Filtered list (even numbers): #{inspect(filtered_list)}")
IO.puts("Mapped list (squares of even numbers): #{inspect(mapped_list)}")

# Generate a random filename
random_filename = "output_#{:rand.uniform(1000000)}.txt"

# Write the results to the file
content = """
Original list: #{inspect(original_list)}
Filtered list (even numbers): #{inspect(filtered_list)}
Mapped list (squares of even numbers): #{inspect(mapped_list)}
"""

File.write!(random_filename, content)

IO.puts("Results saved to #{random_filename}")