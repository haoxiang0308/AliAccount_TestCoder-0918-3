// F# script to process a list of numbers
// Calculates sum, average, maximum, and minimum values

let numbers = [10; 5; 8; 20; 3; 15; 7]

// Function to calculate sum
let sumList lst = List.sum lst

// Function to calculate average
let avgList lst = List.average (List.map float lst)

// Function to find maximum value
let maxList lst = List.max lst

// Function to find minimum value
let minList lst = List.min lst

// Process the list
let sum = sumList numbers
let avg = avgList numbers
let maxVal = maxList numbers
let minVal = minList numbers

// Display results
printfn "List of numbers: %A" numbers
printfn "Sum: %d" sum
printfn "Average: %.2f" avg
printfn "Maximum: %d" maxVal
printfn "Minimum: %d" minVal