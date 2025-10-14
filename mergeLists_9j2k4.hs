-- Функция для объединения двух списков
mergeLists :: [a] -> [a] -> [a]
mergeLists = (++)

-- Пример использования
main :: IO ()
main = do
    let list1 = [1, 2, 3]
    let list2 = [4, 5, 6]
    let result = mergeLists list1 list2
    print result
    -- Вывод: [1,2,3,4,5,6]

    let list3 = ['a', 'b']
    let list4 = ['c', 'd', 'e']
    let result2 = mergeLists list3 list4
    print result2
    -- Вывод: "abcde"