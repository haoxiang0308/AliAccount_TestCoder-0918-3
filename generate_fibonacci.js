import { v4 as uuidv4 } from 'uuid';
import fs from 'fs';

function fibonacciSequence(n) {
  if (n <= 0) {
    console.log("Please enter a positive integer.");
    return [];
  } else if (n === 1) {
    console.log("Fibonacci sequence up to 1 term:");
    console.log([0]);
    return [0];
  }

  const sequence = [0, 1];
  console.log("Fibonacci sequence up to 2 terms:");
  console.log(sequence);

  for (let i = 2; i < n; i++) {
    const nextTerm = sequence[i - 1] + sequence[i - 2];
    sequence.push(nextTerm);
    console.log(`Term ${i + 1}: ${nextTerm}`);
  }

  return sequence;
}

// Example usage:
const n = 10; // Change this value to generate a different number of terms
const result = fibonacciSequence(n);
console.log("Final sequence:", result);

// Generate a random filename and save the function
const randomFileName = `/workspace/fibonacci_${uuidv4()}.js`;
console.log(`Saving function to ${randomFileName}`);

// The content to save (the function definition)
const functionCode = `
function fibonacciSequence(n) {
  if (n <= 0) {
    console.log("Please enter a positive integer.");
    return [];
  } else if (n === 1) {
    console.log("Fibonacci sequence up to 1 term:");
    console.log([0]);
    return [0];
  }

  const sequence = [0, 1];

  for (let i = 2; i < n; i++) {
    const nextTerm = sequence[i - 1] + sequence[i - 2];
    sequence.push(nextTerm);
  }

  return sequence;
}
`;

fs.writeFileSync(randomFileName, functionCode);
console.log("Function saved successfully!");