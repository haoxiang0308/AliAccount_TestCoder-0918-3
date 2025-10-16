-- Recursive function to calculate the length of a list
listLength :: [a] -> Int
listLength [] = 0                    -- Base case: empty list has length 0
listLength (x:xs) = 1 + listLength xs -- Recursive case: 1 + length of the rest

-- Example usage function
exampleUsage :: IO ()
exampleUsage = do
    print $ listLength [1, 2, 3, 4, 5]    -- Output: 5
    print $ listLength []                 -- Output: 0
    print $ listLength ['a', 'b', 'c']    -- Output: 3

-- Main function to write the code to a uniquely named file
main :: IO ()
main = do
    -- Create a file with a unique name based on a counter approach
    let filename = "/workspace/list_length_function_" ++ show (12345 :: Int) ++ ".hs"
    
    -- Content to write to the file
    let content = "-- Recursive function to calculate the length of a list\n" ++
                  "listLength :: [a] -> Int\n" ++
                  "listLength [] = 0                    -- Base case: empty list has length 0\n" ++
                  "listLength (x:xs) = 1 + listLength xs -- Recursive case: 1 + length of the rest\n\n" ++
                  "-- Example usage\n" ++
                  "main :: IO ()\n" ++
                  "main = do\n" ++
                  "    print $ listLength [1, 2, 3, 4, 5]    -- Output: 5\n" ++
                  "    print $ listLength []                 -- Output: 0\n" ++
                  "    print $ listLength ['a', 'b', 'c']    -- Output: 3\n"
    
    -- Write the content to the uniquely named file
    writeFile filename content
    
    putStrLn $ "Successfully wrote the listLength function to " ++ filename
    putStrLn $ "Function definition:"
    putStrLn $ "listLength [] = 0"
    putStrLn $ "listLength (x:xs) = 1 + listLength xs"