-- 递归计算列表长度的Haskell函数

-- 基本情况：空列表的长度为0
length' :: [a] -> Int
length' [] = 0
-- 递归情况：列表的长度等于1加上其余部分的长度
length' (_:xs) = 1 + length' xs

-- 示例用法
main :: IO ()
main = do
    let exampleList = [1, 2, 3, 4, 5]
    putStrLn $ "列表 " ++ show exampleList ++ " 的长度是: " ++ show (length' exampleList)
    
    let emptyList = [] :: [Int]
    putStrLn $ "空列表 " ++ show emptyList ++ " 的长度是: " ++ show (length' emptyList)
    
    let charList = ['a', 'b', 'c']
    putStrLn $ "字符列表 " ++ show charList ++ " 的长度是: " ++ show (length' charList)