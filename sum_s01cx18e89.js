function sum(a, b) {
    return a + b;
}

// Export for Node.js or browser
if (typeof module !== "undefined" && module.exports) {
    module.exports = sum;
} else if (typeof window !== "undefined") {
    window.sum = sum;
}