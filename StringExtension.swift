import Foundation

extension String {
    /// Returns a new string with the characters in reverse order
    func reversed() -> String {
        return String(self.reversed())
    }
    
    /// Reverses the string in place by mutating the original string
    mutating func reverse() {
        self = String(self.reversed())
    }
}

// Example usage:
/*
let originalString = "Hello, World!"
let reversedString = originalString.reversed()
print(reversedString) // Output: !dlroW ,olleH

var mutableString = "Swift"
mutableString.reverse()
print(mutableString) // Output: tfiwS
*/