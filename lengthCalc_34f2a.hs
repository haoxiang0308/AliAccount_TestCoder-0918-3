-- Haskell function to calculate the length of a list using recursion
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

-- Example usage:
-- myLength [1, 2, 3, 4, 5] would return 5
-- myLength "hello" would return 5
-- myLength [] would return 0