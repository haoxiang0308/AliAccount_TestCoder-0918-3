-- This function calculates the length of a list recursively.
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

-- Example usage:
-- myLength [1, 2, 3, 4, 5] returns 5
-- myLength "hello" returns 5