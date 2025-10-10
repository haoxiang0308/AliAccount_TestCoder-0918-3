// StringExtension_9182.swift

import Foundation

// Extension to add a reverse method to String
extension String {
    /// Returns a new string with the characters in reverse order.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
let originalString = "Hello, world!"
let reversedString = originalString.reversed()
print("Original: \(originalString)")
print("Reversed: \(reversedString)")
