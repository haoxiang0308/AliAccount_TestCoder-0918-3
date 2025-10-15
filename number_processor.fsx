open System
open System.IO

// Function to process a list of numbers
let processNumbers numbers =
    numbers
    |> List.map (fun x -> x * x)  // Square each number as an example processing
    |> List.filter (fun x -> x > 10)  // Keep only numbers greater than 10
    |> List.sort

// Example list of numbers to process
let originalNumbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Process the numbers
let processedNumbers = processNumbers originalNumbers

// Generate a random filename
let random = Random()
let randomFileName = sprintf "processed_numbers_%d.txt" (random.Next(1000, 9999))

// Save the processed numbers to the file
let content = 
    sprintf "Original numbers: %A\nProcessed numbers: %A" 
            originalNumbers 
            processedNumbers

File.WriteAllText(randomFileName, content)

printfn "Original numbers: %A" originalNumbers
printfn "Processed numbers: %A" processedNumbers
printfn "Results saved to: %s" randomFileName