listLength :: [a] -> Int
listLength [] = 0                    -- Base case: empty list has length 0
listLength (x:xs) = 1 + listLength xs -- Recursive case: 1 + length of the rest

-- Example usage
main :: IO ()
main = do
    print $ listLength [1, 2, 3, 4, 5]    -- Output: 5
    print $ listLength []                 -- Output: 0
    print $ listLength [a, b, c]    -- Output: 3
