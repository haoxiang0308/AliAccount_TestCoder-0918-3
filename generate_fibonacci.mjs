import { v4 as uuidv4 } from 'uuid';

function generateFibonacci(n) {
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
const randomFileName = `/workspace/fibonacci_${uuidv4()}.js`;

// Create the content for the new file
const fileContent = `// Fibonacci sequence up to \${'n'} terms
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
`;

// Write the content to the new file
import('fs').then(fs => {
  fs.writeFile(randomFileName, fileContent, (err) => {
    if (err) {
      console.error('Error writing file:', err);
    } else {
      console.log('Fibonacci function saved to ' + randomFileName);
    }
  });
});

// Example usage of the generateFibonacci function in this script
const n = 10;
console.log('Fibonacci sequence up to ' + n + ' terms:', generateFibonacci(n));