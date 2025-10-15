/**
 * Filters a list of strings based on a given predicate
 * @param strings The input list of strings to filter
 * @param predicate A function that determines if a string should be included in the result
 * @return A new list containing only the strings that match the predicate
 */
fun filterStrings(strings: List<String>, predicate: (String) -> Boolean): List<String> {
    return strings.filter(predicate)
}

// Example usage:
fun main() {
    val stringList = listOf("apple", "banana", "cherry", "date", "elderberry")
    
    // Filter strings that have length greater than 5
    val longStrings = filterStrings(stringList) { it.length > 5 }
    println("Strings with length > 5: $longStrings")
    
    // Filter strings that start with 'a'
    val startsWithA = filterStrings(stringList) { it.startsWith('a') }
    println("Strings starting with 'a': $startsWithA")
    
    // Filter strings that contain the letter 'e'
    val containsE = filterStrings(stringList) { it.contains('e') }
    println("Strings containing 'e': $containsE")
}