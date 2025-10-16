import System.Random
import Control.Monad
import Data.Char

-- Recursive function to calculate the length of a list
listLength :: [a] -> Int
listLength [] = 0                    -- Base case: empty list has length 0
listLength (x:xs) = 1 + listLength xs -- Recursive case: 1 + length of the rest

-- Generate a random string of specified length
generateRandomString :: Int -> IO String
generateRandomString len = do
    gen <- getStdGen
    let randomChars = take len $ randomRs ('a', 'z') gen
    setStdGen $ mkStdGen $ length randomChars  -- Update the generator
    return randomChars

-- Alternative approach to generate random filename using IO
randomStringIO :: IO String
randomStringIO = replicateM 10 (randomRIO ('a', 'z'))

-- Main function to create the file with random name
main :: IO ()
main = do
    -- Generate a random filename
    randomName <- randomStringIO
    let filename = "/workspace/" ++ randomName ++ ".hs"
    
    putStrLn $ "Creating file: " ++ filename
    
    -- Content to write to the random file
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
    
    -- Write the content to the randomly named file
    writeFile filename content
    
    putStrLn $ "Successfully wrote the listLength function to " ++ filename
    putStrLn $ "The function calculates list length recursively as follows:"
    putStrLn $ "listLength [] = 0"
    putStrLn $ "listLength (x:xs) = 1 + listLength xs"