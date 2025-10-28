-- Function to merge two lists in Haskell
mergeLists :: [a] -> [a] -> [a]
mergeLists xs ys = xs ++ ys

-- Example usage:
-- mergeLists [1,2,3] [4,5,6] would return [1,2,3,4,5,6]
-- mergeLists "hello" "world" would return "helloworld"