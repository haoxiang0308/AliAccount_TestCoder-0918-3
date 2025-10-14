module MyLib
    ( listLength
    ) where

-- | 计算列表的长度
listLength :: [a] -> Int
listLength [] = 0
listLength (x:xs) = 1 + listLength xs
