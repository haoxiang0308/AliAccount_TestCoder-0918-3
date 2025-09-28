// Замыкание для создания фильтра
def createFilter = { predicate ->
    return { list ->
        return list.findAll { item -> predicate(item) }
    }
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// Создаем фильтр для четных чисел
def evenFilter = createFilter { it % 2 == 0 }

// Применяем фильтр
def evenNumbers = evenFilter(numbers)

println "Оригинальный список: $numbers"
println "Четные числа: $evenNumbers"

// Создаем фильтр для чисел больше 5
def greaterThanFiveFilter = createFilter { it > 5 }

// Применяем фильтр
def numbersGreaterThanFive = greaterThanFiveFilter(numbers)

println "Числа больше 5: $numbersGreaterThanFive"
