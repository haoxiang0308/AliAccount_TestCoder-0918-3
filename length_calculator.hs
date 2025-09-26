-- 定义一个递归函数来计算列表的长度
myLength :: [a] -> Int
myLength [] = 0 -- 基本情况：空列表的长度为0
myLength (x:xs) = 1 + myLength xs -- 递归情况：一个元素加上剩余列表的长度

-- 示例用法
main :: IO ()
main = do
    print $ myLength [1, 2, 3, 4, 5] -- 输出 5
    print $ myLength []              -- 输出 0
    print $ myLength ['a', 'b', 'c'] -- 输出 3