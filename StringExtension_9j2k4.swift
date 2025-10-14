// StringExtension_9j2k4.swift

extension String {
    /// Reverses the string and returns a new string.
    /// - Returns: A new string with the characters in reverse order.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
let originalString = "hello, world!"
let reversedString = originalString.reversed()
print("Original: \(originalString)")
print("Reversed: \(reversedString)")
