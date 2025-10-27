// Альтернативное замыкание Groovy для фильтрации списка
def createFilter = { predicate ->
    return { list -> list.findAll(predicate) }
}

// Примеры использования
def positiveNumbers = createFilter { it > 0 }
def negativeNumbers = createFilter { it < 0 }
def longWords = createFilter { it.length() >= 6 }

def numbers = [-5, -2, 0, 3, 7, -1, 9]
def words = ["cat", "elephant", "dog", "hippopotamus", "bird"]

println "Положительные числа: ${positiveNumbers(numbers)}"
println "Отрицательные числа: ${negativeNumbers(numbers)}"
println "Длинные слова: ${longWords(words)}"