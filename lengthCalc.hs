-- 递归计算列表长度的函数
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

-- 示例用法
main :: IO ()
main = do
    let list1 = [1, 2, 3, 4, 5]
    let list2 = "Hello"
    putStrLn $ "Length of " ++ show list1 ++ " is: " ++ show (myLength list1)
    putStrLn $ "Length of " ++ show list2 ++ " is: " ++ show (myLength list2)
