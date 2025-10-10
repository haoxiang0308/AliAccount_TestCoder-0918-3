-- | Объединяет два списка в один.
mergeLists :: [a] -> [a] -> [a]
mergeLists xs ys = xs ++ ys

-- Пример использования:
-- mergeLists [1, 2, 3] [4, 5, 6] -> [1, 2, 3, 4, 5, 6]
-- mergeLists "hello" "world" -> "helloworld"