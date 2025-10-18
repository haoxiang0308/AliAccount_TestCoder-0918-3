-- 递归函数计算列表长度
listLength :: [a] -> Int
listLength [] = 0                    -- 空列表长度为0
listLength (x:xs) = 1 + listLength xs -- 非空列表长度为1加上剩余列表的长度

-- 示例用法
main :: IO ()
main = do
    print $ listLength [1, 2, 3, 4, 5]     -- 输出: 5
    print $ listLength []                  -- 输出: 0
    print $ listLength ['a', 'b', 'c']     -- 输出: 3
    print $ listLength ["hello", "world"]  -- 输出: 2