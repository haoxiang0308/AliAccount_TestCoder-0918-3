-- Haskell function to calculate the length of a list using recursion
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

-- Example usage:
-- main = print (myLength [1, 2, 3, 4, 5]) -- This would print 5