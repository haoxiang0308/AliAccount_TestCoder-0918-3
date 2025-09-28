-- Функция для объединения двух списков
mergeLists :: [a] -> [a] -> [a]
mergeLists list1 list2 = list1 ++ list2

-- Пример использования
main :: IO ()
main = do
    let result = mergeLists [1, 2, 3] [4, 5, 6]
    print result
    let result2 = mergeLists "Hello" "World"
    print result2