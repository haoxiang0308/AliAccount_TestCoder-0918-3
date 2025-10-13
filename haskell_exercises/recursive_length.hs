-- 定义一个递归函数来计算列表的长度
myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

-- 示例用法
main :: IO ()
main = do
    let exampleList = [1, 2, 3, 4, 5]
    print (myLength exampleList) -- 输出 5