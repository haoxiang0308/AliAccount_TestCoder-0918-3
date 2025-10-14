// StringExtension.swift
// This file contains an extension for the String type in Swift.
// It adds a method to reverse the string in place.

extension String {
    /// Reverses the string in place.
    mutating func reverse() {
        self = String(self.reversed())
    }
    
    /// Returns a new string with the characters in reversed order.
    /// - Returns: A new `String` instance with the characters reversed.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
// var myString = "Hello, world!"
// myString.reverse()
// print(myString) // prints: !dlrow ,olleH
//
// let original = "Swift"
// let reversedString = original.reversed()
// print(reversedString) // prints: tfiwS
