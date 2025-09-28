-- | Function to merge two lists by concatenating them.
mergeLists :: [a] -> [a] -> [a]
mergeLists xs ys = xs ++ ys

-- Example usage:
-- mergeLists [1, 2, 3] [4, 5, 6]  -- Result: [1, 2, 3, 4, 5, 6]
-- mergeLists "Hello" "World"        -- Result: "HelloWorld"