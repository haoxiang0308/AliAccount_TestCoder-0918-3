/**
 * Generates the Fibonacci sequence up to n terms.
 * @param {number} n - The number of terms to generate.
 * @returns {number[]} An array containing the Fibonacci sequence.
 */
function fibonacci(n) {
  if (n <= 0) {
    return [];
  } else if (n === 1) {
    return [0];
  }

  const sequence = [0, 1];
  for (let i = 2; i < n; i++) {
    const next = sequence[i - 1] + sequence[i - 2];
    sequence.push(next);
  }
  return sequence;
}

// Example usage:
const n = 10;
console.log(`Fibonacci sequence up to ${n} terms:`, fibonacci(n));
