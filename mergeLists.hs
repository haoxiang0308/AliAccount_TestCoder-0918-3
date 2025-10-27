-- Function to merge two lists
mergeLists :: [a] -> [a] -> [a]
mergeLists xs ys = xs ++ ys

-- Example usage:
-- mergeLists [1,2,3] [4,5,6] returns [1,2,3,4,5,6]
-- mergeLists "hello" "world" returns "helloworld"