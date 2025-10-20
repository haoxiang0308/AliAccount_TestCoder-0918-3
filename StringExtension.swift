// String extension to add reverse method
extension String {
    /// Returns a new string with the characters in reverse order
    func reversed() -> String {
        return String(self.reversed()) // This uses the Collection's reversed() method which returns a ReversedCollection
    }
    
    /// Reverses the string in place
    mutating func reverse() {
        self = self.reversed()
    }
}