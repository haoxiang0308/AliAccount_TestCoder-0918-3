// Замыкание для фильтрации списка
def filterClosure = { list ->
    list.findAll { it > 5 }
}

// Пример использования
def numbers = [1, 3, 7, 8, 2, 9, 4, 10]
def filteredNumbers = filterClosure(numbers)
println "Original list: $numbers"
println "Filtered list (numbers > 5): $filteredNumbers"