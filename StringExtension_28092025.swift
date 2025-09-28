extension String {
    /// Reverses the string in place.
    mutating func reverse() {
        self = String(self.reversed())
    }

    /// Returns a new string with the characters in reverse order.
    /// - Returns: A new string with characters reversed.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
var myString = "hello"
print("Original: $myString)") // Output: Original: hello

myString.reverse()
print("After mutating reverse: $myString)") // Output: After mutating reverse: olleh

let reversedString = "world".reversed()
print("Reversed copy: $reversedString)") // Output: Reversed copy: dlrow
