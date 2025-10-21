// Замыкание для фильтрации списка
def filterClosure = { list, condition ->
    return list.findAll(condition)
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterClosure(numbers) { it % 2 == 0 }
println "Четные числа: ${evenNumbers}"

def strings = ["apple", "banana", "cherry", "date", "elderberry"]
def longStrings = filterClosure(strings) { it.length() > 5 }
println "Строки длиной более 5 символов: ${longStrings}"