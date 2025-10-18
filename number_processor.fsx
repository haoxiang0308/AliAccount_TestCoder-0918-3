// F# program to process a list of numbers and save to a file with a random name

open System
open System.IO

// Function to generate a random filename
let generateRandomFileName extension =
    let random = Random()
    let randomPart = random.Next(100000, 999999) // 6-digit random number
    sprintf "output_%d%s" randomPart extension

// Function to process a list of numbers (example: calculate squares)
let processNumbers numbers =
    numbers |> List.map (fun x -> x * x)

// Example list of numbers
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Process the numbers
let processedNumbers = processNumbers numbers

// Generate a random filename
let fileName = generateRandomFileName ".txt"

// Convert the processed numbers to a string
let content = 
    processedNumbers 
    |> List.map string 
    |> String.concat "\n"

// Write to the file
File.WriteAllText(fileName, content)

printfn "Processed numbers: %A" processedNumbers
printfn "Saved to file: %s" fileName