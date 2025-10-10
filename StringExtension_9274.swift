extension String {
    /// Reverses the string and returns a new String.
    /// Example:
    /// ```
    /// let original = "hello"
    /// let reversed = original.reversedString()
    /// print(reversed) // Prints "olleh"
    /// ```
    func reversedString() -> String {
        return String(self.reversed())
    }
}

// Example usage:
let myString = "Hello, world!"
let reversedString = myString.reversedString()
print("Original: \(myString)")
print("Reversed: \(reversedString)")
