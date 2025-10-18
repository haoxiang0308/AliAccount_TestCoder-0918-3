//
//  StringExtension.swift
//  String Extension for Reverse Method
//

extension String {
    /// Reverses the string and returns a new string
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
// let originalString = "Hello, World!"
// let reversedString = originalString.reversed()
// print(reversedString) // Output: !dlroW ,olleH