-- | Recursively calculates the length of a list.
listLength :: [a] -> Int
listLength [] = 0
listLength (_:xs) = 1 + listLength xs

-- Example usage:
-- listLength [1, 2, 3, 4, 5]  -- Result: 5
-- listLength []               -- Result: 0