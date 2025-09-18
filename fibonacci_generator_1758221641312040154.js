/**
 * Generates and returns the Fibonacci sequence up to n terms
 * @param {number} n - The number of terms to generate
 * @returns {Array<number>} - Array containing the Fibonacci sequence
 */
function fibonacci(n) {
  if (n <= 0) return [];
  if (n === 1) return [0];
  if (n === 2) return [0, 1];
  
  const sequence = [0, 1];
  for (let i = 2; i < n; i++) {
    sequence[i] = sequence[i - 1] + sequence[i - 2];
  }
  
  return sequence;
}

// Example usage:
// console.log(fibonacci(10)); // Outputs: [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

module.exports = fibonacci;