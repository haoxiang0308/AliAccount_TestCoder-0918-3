// Замыкание для фильтрации списка
def filterNumbers = { list, condition ->
    return list.findAll(condition)
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterNumbers(numbers, { it % 2 == 0 })
def greaterThanFive = filterNumbers(numbers, { it > 5 })

println "Original list: ${numbers}"
println "Even numbers: ${evenNumbers}"
println "Numbers greater than 5: ${greaterThanFive}"