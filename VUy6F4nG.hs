-- Function to merge two lists in Haskell
mergeLists :: [a] -> [a] -> [a]
mergeLists xs ys = xs ++ ys

-- Alternative implementation with explicit recursion
mergeListsRecursive :: [a] -> [a] -> [a]
mergeListsRecursive [] ys = ys
mergeListsRecursive (x:xs) ys = x : mergeListsRecursive xs ys

-- Example usage
main :: IO ()
main = do
    let list1 = [1, 2, 3]
    let list2 = [4, 5, 6]
    let merged = mergeLists list1 list2
    putStrLn $ "Merged list: " ++ show merged