// Generate a random filename component
const randomId = Math.random().toString(36).substring(2, 8);

// Define the Fibonacci function
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

// Example usage
console.log(`Fibonacci sequence for 10 terms:`, fibonacci(10));

// Export the function for potential reuse
module.exports = { fibonacci, randomId };
