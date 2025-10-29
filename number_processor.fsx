// F# program to process a list of numbers
open System

// Function to process a list of numbers
let processNumbers numbers =
    let sum = List.sum numbers
    let average = List.average numbers
    let max = List.max numbers
    let min = List.min numbers
    let squared = List.map (fun x -> x * x) numbers
    let evenNumbers = List.filter (fun x -> x % 2 = 0) numbers
    
    printfn "Original numbers: %A" numbers
    printfn "Sum: %d" sum
    printfn "Average: %.2f" average
    printfn "Max: %d" max
    printfn "Min: %d" min
    printfn "Squared values: %A" squared
    printfn "Even numbers: %A" evenNumbers
    printfn ""

// Example usage with different lists
let numberList1 = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
let numberList2 = [15; 23; 8; 42; 7; 91; 5; 33]
let numberList3 = [-5; -2; 0; 3; 8; -1; 12]

printfn "Processing first list:"
processNumbers numberList1

printfn "Processing second list:"
processNumbers numberList2

printfn "Processing third list (with negative numbers):"
processNumbers numberList3

// Additional processing: calculating factorial of each number (for positive numbers only)
let calculateFactorial n =
    if n <= 0 then 1
    else [1..n] |> List.fold (*) 1

let processWithFactorials numbers =
    let positiveNumbers = List.filter (fun x -> x > 0) numbers
    let factorials = List.map calculateFactorial positiveNumbers
    printfn "Positive numbers: %A" positiveNumbers
    printfn "Factorials: %A" factorials
    printfn ""

printfn "Processing with factorials:"
processWithFactorials numberList2