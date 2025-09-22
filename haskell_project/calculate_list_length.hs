-- 递归计算列表长度的Haskell函数

-- 基本情况：空列表的长度为0
listLength :: [a] -> Int
listLength [] = 0
-- 递归情况：列表的长度等于1加上其余部分的长度
listLength (x:xs) = 1 + listLength xs

-- 示例用法
exampleList :: [Int]
exampleList = [1, 2, 3, 4, 5]

main :: IO ()
main = do
  putStrLn $ "The length of [1, 2, 3, 4, 5] is: " ++ show (listLength exampleList)
  putStrLn $ "The length of ['a', 'b', 'c'] is: " ++ show (listLength ['a', 'b', 'c'])
  putStrLn $ "The length of [] is: " ++ show (listLength ([] :: [Int]))
