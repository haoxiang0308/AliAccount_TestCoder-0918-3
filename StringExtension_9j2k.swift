extension String {
    /// Reverses the string and returns a new String.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
let originalString = "hello"
let reversedString = originalString.reversed()
print("Original: \(originalString)")
print("Reversed: \(reversedString)")
