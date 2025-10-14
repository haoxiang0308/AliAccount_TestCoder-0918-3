// Замыкание для фильтрации списка
def filterNumbers = { list ->
    return list.findAll { it instanceof Number && it > 0 }
}

// Пример использования
def mixedList = [1, -2, 3, "hello", 4.5, null, 0, 7]
def filteredList = filterNumbers(mixedList)

println "Исходный список: $mixedList"
println "Отфильтрованный список (только положительные числа): $filteredList"
