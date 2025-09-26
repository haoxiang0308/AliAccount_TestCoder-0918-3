// Замыкание Groovy для фильтрации списка
def filterNumbers = { list, threshold ->
    return list.findAll { it > threshold }
}

// Пример использования
def numbers = [1, 5, 10, 15, 20, 25]
def result = filterNumbers(numbers, 12)
println "Исходный список: $numbers"
println "Элементы больше 12: $result"
