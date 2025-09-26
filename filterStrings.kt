/**
 * Фильтрует список строк, возвращая только те, которые начинаются с заглавной буквы.
 * @param inputList Список строк для фильтрации.
 * @return Отфильтрованный список строк.
 */
fun filterStringsStartingWithUppercase(inputList: List<String>): List<String> {
    return inputList.filter { it.firstOrNull()?.isUpperCase() == true }
}

// Пример использования
fun main() {
    val strings = listOf("hello", "World", "Kotlin", "code", "Programming")
    val filteredStrings = filterStringsStartingWithUppercase(strings)
    println(filteredStrings) // Выведет: [World, Kotlin, Programming]
}