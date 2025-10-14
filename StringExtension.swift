//
//  StringExtension.swift
//  String+Reverse
//
//  Created by Assistant on 2025-10-15.
//

import Foundation

extension String {
    /// Reverses the string and returns a new reversed string.
    /// - Returns: A new string with the characters in reverse order.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
// let originalString = "Hello, World!"
// let reversedString = originalString.reversed()
// print(reversedString) // Output: !dlroW ,olleH