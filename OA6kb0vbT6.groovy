// Замыкание для фильтрации списка (фильтруем числа больше 5)
def filterClosure = { list ->
    return list.findAll { it > 5 } // Фильтруем числа больше 5
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def filteredNumbers = filterClosure(numbers)
println "Исходный список: ${numbers}"
println "Отфильтрованный список (числа больше 5): ${filteredNumbers}"
