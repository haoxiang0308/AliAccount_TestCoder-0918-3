-- Функция для объединения двух списков
mergeLists :: [a] -> [a] -> [a]
mergeLists xs ys = xs ++ ys

-- Пример использования
main :: IO ()
main = do
    let list1 = [1, 2, 3]
    let list2 = [4, 5, 6]
    let result = mergeLists list1 list2
    putStrLn $ "Результат объединения: " ++ show result
    
    let str1 = "Hello, "
    let str2 = "World!"
    let strResult = mergeLists str1 str2
    putStrLn $ "Результат объединения строк: " ++ strResult