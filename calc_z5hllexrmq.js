function addNumbers(x, y) {
    return x + y;
}
// Export для использования в разных средах
if (typeof exports !== 'undefined') {
    exports.addNumbers = addNumbers;
}
if (typeof window !== 'undefined') {
    window.addNumbers = addNumbers;
}