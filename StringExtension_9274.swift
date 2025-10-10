extension String {
    /// Reverses the string in place.
    mutating func reverse() {
        self = String(self.reversed())
    }

    /// Returns a new string with the characters in reverse order.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
var myString = "hello"
print(myString.reversed()) // Output: "olleh"

myString.reverse()
print(myString) // Output: "olleh"