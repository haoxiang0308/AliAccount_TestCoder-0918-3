import random
import string

# Generate a random filename
def generate_random_filename():
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"{random_string}.fs"

# Create the F# code as a string
fsharp_code = '''// F# script for processing a list of numbers

open System

// Function to calculate the sum of a list
let sumList lst = List.sum lst

// Function to calculate the product of a list
let productList lst = List.fold (*) 1 lst

// Function to get the maximum value in a list
let maxList lst = List.max lst

// Function to get the minimum value in a list
let minList lst = List.min lst

// Function to calculate the average of a list
let avgList lst = 
    let sum = sumList lst
    let count = List.length lst
    float sum / float count

// Example list of numbers
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Processing the list
let sum = sumList numbers
let product = productList numbers
let max = maxList numbers
let min = minList numbers
let avg = avgList numbers

// Output the results
printfn "Numbers: %A" numbers
printfn "Sum: %d" sum
printfn "Product: %d" product
printfn "Max: %d" max
printfn "Min: %d" min
printfn "Average: %.2f" avg
'''

# Generate random filename
random_filename = generate_random_filename()

# Write the F# code to the randomly named file
with open(random_filename, 'w') as f:
    f.write(fsharp_code)

print(f"F# program saved to {random_filename}")