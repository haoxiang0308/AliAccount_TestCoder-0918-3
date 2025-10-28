-- 递归函数计算列表长度
listLength :: [a] -> Int
listLength [] = 0
listLength (x:xs) = 1 + listLength xs

-- 示例用法
main :: IO ()
main = do
    let testList = [1, 2, 3, 4, 5]
    putStrLn $ "列表 " ++ show testList ++ " 的长度是: " ++ show (listLength testList)
    
    let emptyList = []
    putStrLn $ "空列表的长度是: " ++ show (listLength emptyList)
    
    let charList = ['h', 'e', 'l', 'l', 'o']
    putStrLn $ "字符列表 " ++ show charList ++ " 的长度是: " ++ show (listLength charList)