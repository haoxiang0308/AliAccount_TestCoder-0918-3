-- Haskell recursive function to calculate the length of a list
listLength :: [a] -> Int
listLength [] = 0
listLength (x:xs) = 1 + listLength xs

-- Example usage:
-- listLength [1, 2, 3, 4, 5] returns 5
-- listLength [] returns 0
-- listLength ['a', 'b', 'c'] returns 3