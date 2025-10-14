-- 定义一个递归函数来计算列表的长度
listLength :: [a] -> Int
listLength [] = 0              -- 基本情况：空列表的长度为0
listLength (x:xs) = 1 + listLength xs  -- 递归情况：当前元素计为1，加上剩余列表的长度

-- 示例用法
main :: IO ()
main = do
    let exampleList = [1, 2, 3, 4, 5]
    putStrLn $ "列表 " ++ show exampleList ++ " 的长度是: " ++ show (listLength exampleList)