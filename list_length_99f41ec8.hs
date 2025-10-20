-- 递归函数计算列表长度
listLength :: [a] -> Int
listLength [] = 0
listLength (x:xs) = 1 + listLength xs

-- 示例用法
main :: IO ()
main = do
    let exampleList = [1, 2, 3, 4, 5]
    putStrLn $ "列表 " ++ show exampleList ++ " 的长度是: " ++ show (listLength exampleList)
    
    let emptyList = []
    putStrLn $ "空列表的长度是: " ++ show (listLength emptyList)
    
    let stringList = "hello"
    putStrLn $ "字符串列表 " ++ show stringList ++ " 的长度是: " ++ show (listLength stringList)