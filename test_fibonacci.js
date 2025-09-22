// Test the fibonacci function
const fibonacci = require('./fibonacci_generator.js');

// Test with different values
console.log("Fibonacci sequence for 5 terms:");
fibonacci.fibonacci(5);

console.log("\nFibonacci sequence for 10 terms:");
fibonacci.fibonacci(10);

console.log("\nFibonacci sequence for 1 term:");
fibonacci.fibonacci(1);

console.log("\nFibonacci sequence for 0 terms:");
fibonacci.fibonacci(0);