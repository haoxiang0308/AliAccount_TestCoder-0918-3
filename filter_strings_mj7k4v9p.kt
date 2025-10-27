/**
 * Функция для фильтрации списка строк по заданному критерию
 * @param strings Список строк для фильтрации
 * @param predicate Функция-предикат для определения, какие строки оставить
 * @return Отфильтрованный список строк
 */
fun filterStrings(strings: List<String>, predicate: (String) -> Boolean): List<String> {
    return strings.filter(predicate)
}

// Пример использования функции
fun main() {
    val strings = listOf("apple", "banana", "cherry", "date", "elderberry")
    
    // Фильтрация строк, длина которых больше 5 символов
    val filteredByLength = filterStrings(strings) { it.length > 5 }
    println("Строки длиной больше 5: $filteredByLength")
    
    // Фильтрация строк, начинающихся с буквы 'a'
    val filteredByStart = filterStrings(strings) { it.startsWith('a') }
    println("Строки, начинающиеся с 'a': $filteredByStart")
    
    // Фильтрация строк, содержащих букву 'e'
    val filteredByContains = filterStrings(strings) { it.contains('e') }
    println("Строки, содержащие 'e': $filteredByContains")
}