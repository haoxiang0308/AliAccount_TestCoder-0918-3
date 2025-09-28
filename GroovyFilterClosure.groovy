// Замыкание для фильтрации списка
def filterNumbersGreaterThanFive = { list ->
    return list.findAll { it > 5 }
}

// Пример использования
def numbers = [1, 3, 5, 7, 9, 2, 10]
def filteredNumbers = filterNumbersGreaterThanFive(numbers)
println "Original list: $numbers"
println "Filtered list (n > 5): $filteredNumbers"
