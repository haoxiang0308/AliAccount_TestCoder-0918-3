import random
import string
import os

# F# program content
fsharp_code = '''// F# program to process a list of numbers
open System

// Function to process a list of numbers
let processNumbers numbers =
    let sum = List.sum numbers
    let average = List.average numbers
    let max = List.max numbers
    let min = List.min numbers
    let squared = List.map (fun x -> x * x) numbers
    
    printfn "Original list: %A" numbers
    printfn "Sum: %d" sum
    printfn "Average: %.2f" average
    printfn "Max: %d" max
    printfn "Min: %d" min
    printfn "Squared values: %A" squared
    
    (sum, average, max, min, squared)

// Example list of numbers
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Process the numbers
let results = processNumbers numbers

// Additional processing: filter even numbers
let evenNumbers = List.filter (fun x -> x % 2 = 0) numbers
printfn "Even numbers: %A" evenNumbers

// Additional processing: calculate factorial of each number
let factorial n = 
    let rec factorialInner acc i =
        if i <= 1 then acc
        else factorialInner (acc * i) (i - 1)
    factorialInner 1 n

let factorials = List.map factorial (List.filter (fun x -> x <= 10) numbers)
printfn "Factorials: %A" factorials
'''

# Generate a random filename
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.fsx'
file_path = os.path.join('/workspace', random_name)

# Write the F# code to the file with random name
with open(file_path, 'w') as f:
    f.write(fsharp_code)

print(f"F# program saved to: {file_path}")