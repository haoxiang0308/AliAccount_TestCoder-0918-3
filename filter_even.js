// Helper function to generate a random filename
function generateRandomFilename() {
  const randomString = Math.random().toString(36).substring(2, 15);
  const timestamp = Date.now().toString();
  return `filtered_array_${randomString}_${timestamp}.js`;
}

// Main function to filter even numbers and save to a file
function filterAndSaveEvenNumbers(inputArray) {
  // Filter even numbers from the input array
  const evenNumbers = inputArray.filter(num => num % 2 === 0);

  // Generate a random filename
  const filename = generateRandomFilename();

  // Create the content for the file
  const fileContent = `// This file contains the even numbers filtered from an input array
const evenNumbers = ${JSON.stringify(evenNumbers)};

// Example usage:
// console.log(evenNumbers); // Outputs: ${JSON.stringify(evenNumbers)}

module.exports = { evenNumbers };
`;

  // Write the content to the file
  const fs = require('fs');
  fs.writeFileSync(filename, fileContent);

  console.log(`Array of even numbers has been saved to ${filename}`);
  return filename;
}

// Example usage of the main function
const inputArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const savedFilename = filterAndSaveEvenNumbers(inputArray);
