-- Function to calculate the length of a list recursively
listLength :: [a] -> Int
listLength [] = 0
listLength (_:xs) = 1 + listLength xs

-- Main function to demonstrate usage
main :: IO ()
main = do
  let exampleList = [1, 2, 3, 4, 5]
  putStrLn $ "The length of the list " ++ show exampleList ++ " is: " ++ show (listLength exampleList)