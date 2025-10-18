open System
open System.IO

// Function to process a list of numbers (example: calculate squares, filter even numbers, sum)
let processNumbers numbers =
    numbers
    |> List.map (fun x -> x * x)  // Square each number
    |> List.filter (fun x -> x % 2 = 0)  // Keep only even squares
    |> List.sum  // Sum the results

// Generate a random filename
let generateRandomFileName extension =
    let chars = "abcdefghijklmnopqrstuvwxyz0123456789"
    let random = Random()
    let randomString = 
        [|1..10|] 
        |> Array.map (fun _ -> chars.[random.Next(chars.Length)])
        |> System.String
    sprintf "%s%s" randomString extension

// Example list of numbers to process
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Process the numbers
let result = processNumbers numbers

// Generate random filename
let fileName = generateRandomFileName ".txt"

// Save the result to the file
let content = sprintf "Original numbers: %A\nProcessed result (sum of even squares): %d" numbers result
File.WriteAllText(fileName, content)

printfn "Processed numbers: %A" numbers
printfn "Result (sum of even squares): %d" result
printfn "Data saved to file: %s" fileName