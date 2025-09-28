/**
 * Generates the Fibonacci sequence up to n terms.
 * @param {number} n - The number of terms in the sequence.
 * @returns {Array<number>} An array containing the Fibonacci sequence.
 */
function fibonacci(n) {
  if (n <= 0) {
    return [];
  } else if (n === 1) {
    return [0];
  } else if (n === 2) {
    return [0, 1];
  }

  const sequence = [0, 1];
  for (let i = 2; i < n; i++) {
    const nextTerm = sequence[i - 1] + sequence[i - 2];
    sequence.push(nextTerm);
  }
  return sequence;
}

// Example usage:
const n = 10; // Change this value to generate a different number of terms
console.log(`The first ${n} terms of the Fibonacci sequence are:`, fibonacci(n));
