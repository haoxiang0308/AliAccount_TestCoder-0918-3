open System
open System.IO

// Function to generate a random filename
let generateRandomFileName extension =
    let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let random = Random()
    let randomString = 
        [|1..10|] 
        |> Array.map (fun _ -> chars.[random.Next(chars.Length)])
        |> System.String
    sprintf "%s%s" randomString extension

// List of numbers to process
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Process the numbers (for example, square each number and filter even results)
let processedNumbers = 
    numbers
    |> List.map (fun x -> x * x)
    |> List.filter (fun x -> x % 2 = 0)

// Generate a random filename with .txt extension
let fileName = generateRandomFileName ".txt"

// Save the processed numbers to the file
let content = 
    sprintf "Original numbers: %A\nProcessed numbers (squared and filtered even): %A" 
            numbers processedNumbers

File.WriteAllText(fileName, content)

printfn "Numbers processed and saved to file: %s" fileName
printfn "Original numbers: %A" numbers
printfn "Processed numbers: %A" processedNumbers