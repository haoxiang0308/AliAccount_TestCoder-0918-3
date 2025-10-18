#!/usr/bin/env python3
"""
Python script demonstrating array iteration and printing elements.
This is equivalent to using blocks in Ruby to iterate through an array.
"""

# Define an array (list in Python)
my_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Method 1: Using a for loop (similar to Ruby's each block)
print("Using for loop:")
for element in my_array:
    print(element)

print("\n" + "="*30 + "\n")

# Method 2: Using map-like functionality with a lambda function
print("Using map with lambda (similar to Ruby's map block):")
result = list(map(lambda x: print(f"Element: {x}"), my_array))

print("\n" + "="*30 + "\n")

# Method 3: Using list comprehension with side effects
print("Using list comprehension with print:")
[print(f"Value: {item}") for item in my_array]

print("\n" + "="*30 + "\n")

# Method 4: Using enumerate to get both index and value
print("Using enumerate (like Ruby's each_with_index):")
for index, value in enumerate(my_array):
    print(f"Index: {index}, Value: {value}")