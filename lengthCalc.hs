-- 定义一个递归函数来计算列表的长度
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

-- 示例用法
main :: IO ()
main = do
    let list = [1, 2, 3, 4, 5]
    putStrLn $ "列表 " ++ show list ++ " 的长度是: " ++ show (myLength list)