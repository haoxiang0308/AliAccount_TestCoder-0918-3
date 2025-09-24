import { v4 as uuidv4 } from 'uuid';

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

// Generate a random filename using uuid
const randomFileName = `/workspace/fibonacci_${uuidv4()}.js`;

// Content to be written to the file
const fileContent = `// Fibonacci Sequence Generator
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
// console.log(fibonacci(10)); // Output: [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

module.exports = fibonacci;
`;

import fs from 'fs';
fs.writeFileSync(randomFileName, fileContent);

console.log('Fibonacci function written to ' + randomFileName);
console.log(fibonacci(10)); // Example output