// Замыкание для фильтрации списка
def filterClosure = { list ->
    return list.findAll { it % 2 == 0 } // Фильтруем четные числа
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def filteredNumbers = filterClosure(numbers)
println "Исходный список: ${numbers}"
println "Отфильтрованный список (четные числа): ${filteredNumbers}"