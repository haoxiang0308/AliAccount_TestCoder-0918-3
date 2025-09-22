-- Function to merge two lists
mergeLists :: [a] -> [a] -> [a]
mergeLists xs ys = xs ++ ys

-- Example usage:
-- mergeLists [1,2,3] [4,5,6] will return [1,2,3,4,5,6]
-- mergeLists ["a","b"] ["c","d"] will return ["a","b","c","d"]