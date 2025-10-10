// Helper function to generate a random string for the filename
function generateRandomString(length) {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  let result = '';
  for (let i = 0; i < length; i++) {
    result += chars.charAt(Math.floor(Math.random() * chars.length));
  }
  return result;
}

// Function to generate Fibonacci sequence up to n terms
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

// Generate a random filename
const randomFileName = `fibonacci_${generateRandomString(8)}.js`;

// Example usage:
// const n = 10;
// const fibSequence = fibonacci(n);
// console.log(`Fibonacci sequence up to ${n} terms:`, fibSequence);

module.exports = { fibonacci, randomFileName };
