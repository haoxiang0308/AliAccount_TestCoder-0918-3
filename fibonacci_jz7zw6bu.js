
// JavaScript function to generate Fibonacci sequence up to n terms
function fibonacciSequence(n) {
  if (n <= 0) return [];
  if (n === 1) return [0];
  const sequence = [0, 1];
  for (let i = 2; i < n; i++) {
    sequence[i] = sequence[i - 1] + sequence[i - 2];
  }
  return sequence;
}

// Example usage:
// console.log(fibonacciSequence(10)); // Output: [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

module.exports = fibonacciSequence;
