extension String {
    /// Reverses the string and returns a new string
    func reversed() -> String {
        return String(self.reversed())
    }
    
    /// Reverses the string in place
    mutating func reverse() {
        self = String(self.reversed())
    }
}

// Example usage:
// let originalString = "Hello, World!"
// let reversedString = originalString.reversed()  // "!dlroW ,olleH"
// 
// var mutableString = "Swift"
// mutableString.reverse()  // mutableString is now "tfiwS"