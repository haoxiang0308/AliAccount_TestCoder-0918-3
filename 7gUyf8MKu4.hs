-- Recursive function to calculate the length of a list
listLength :: [a] -> Int
listLength [] = 0
listLength (x:xs) = 1 + listLength xs

-- Example usage
main :: IO ()
main = do
    let exampleList = [1, 2, 3, 4, 5]
    putStrLn $ "Length of " ++ show exampleList ++ " is: " ++ show (listLength exampleList)
    
    let emptyList = []
    putStrLn $ "Length of " ++ show emptyList ++ " is: " ++ show (listLength emptyList)
    
    let stringList = ['h', 'e', 'l', 'l', 'o']
    putStrLn $ "Length of " ++ show stringList ++ " is: " ++ show (listLength stringList)