module MyListUtils where

-- | 计算列表长度的递归函数
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs
