// F# script for processing a list of numbers

// Original list of numbers
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Process the list: square each number and filter even results
let processedNumbers = 
    numbers
    |> List.map (fun x -> x * x)
    |> List.filter (fun x -> x % 2 = 0)

printfn "Original numbers: %A" numbers
printfn "Processed numbers (squares that are even): %A" processedNumbers

// Save the processed list to a text file
let fileName = "processed_numbers_output.txt"
System.IO.File.WriteAllText(fileName, (sprintf "%A" processedNumbers))
printfn "Processed numbers saved to %s" fileName