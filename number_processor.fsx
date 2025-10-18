open System
open System.IO

// Function to process a list of numbers (example: calculate squares)
let processNumbers numbers = 
    numbers |> List.map (fun x -> x * x)

// Function to generate a random filename
let generateRandomFileName extension =
    let random = Random()
    let chars = "abcdefghijklmnopqrstuvwxyz0123456789"
    let randomString = 
        [1..8] 
        |> List.map (fun _ -> chars.[random.Next(chars.Length)])
        |> List.toArray
        |> System.String
    sprintf "%s%s" randomString extension

// Main program
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Process the numbers
let processedNumbers = processNumbers numbers

// Generate a random filename
let fileName = generateRandomFileName ".txt"

// Write the processed numbers to the file
let content = sprintf "Original numbers: %A\nProcessed numbers (squared): %A" numbers processedNumbers
File.WriteAllText(fileName, content)

printfn "Processed numbers: %A" processedNumbers
printfn "Results saved to file: %s" fileName