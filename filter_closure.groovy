// Замыкание для фильтрации списка
def filterByClosure = { list, condition ->
    return list.findAll(condition)
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterByClosure(numbers) { it % 2 == 0 }
println "Четные числа: $evenNumbers"

def words = ["apple", "banana", "cherry", "date"]
def longWords = filterByClosure(words) { it.length() > 5 }
println "Слова длиннее 5 символов: $longWords"