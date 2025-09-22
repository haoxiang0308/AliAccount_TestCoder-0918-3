-- 递归计算列表长度的Haskell函数

-- 基本情况：空列表的长度为0
-- 递归情况：列表的长度等于1加上其余部分的长度
myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

-- 测试函数
main :: IO ()
main = do
    putStrLn "测试列表长度函数："
    putStrLn $ "myLength [] = " ++ show (myLength [])
    putStrLn $ "myLength [1,2,3] = " ++ show (myLength [1,2,3])
    putStrLn $ "myLength \"Hello\" = " ++ show (myLength "Hello")
    putStrLn $ "myLength [1..10] = " ++ show (myLength [1..10])