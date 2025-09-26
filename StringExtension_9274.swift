// StringExtension_9274.swift

extension String {
    /// Reverses the string and returns a new String instance.
    /// Example: "hello".reversedString() returns "olleh"
    func reversedString() -> String {
        return String(self.reversed())
    }
}

// Example usage:
// let original = "hello, world"
// let reversed = original.reversedString()
// print(reversed) // Prints: "dlrow ,olleh"