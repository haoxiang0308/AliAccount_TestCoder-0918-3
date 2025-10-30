// Function to filter even numbers from an array and save to a randomly named file
const fs = require('fs');
const path = require('path');

function filterAndSaveEvenNumbers(inputArray, outputDir = './') {
  // Filter even numbers from the input array
  const evenNumbers = inputArray.filter(num => num % 2 === 0);
  
  // Generate a random filename
  const randomFileName = `even_numbers_${Date.now()}_${Math.floor(Math.random() * 10000)}.json`;
  const filePath = path.join(outputDir, randomFileName);
  
  // Convert the array to JSON string
  const jsonData = JSON.stringify(evenNumbers, null, 2);
  
  // Write the data to the file
  fs.writeFileSync(filePath, jsonData);
  
  console.log(`Even numbers filtered and saved to: ${filePath}`);
  console.log(`Filtered even numbers: [${evenNumbers.join(', ')}]`);
  
  return filePath;
}

// Example usage
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
const savedFilePath = filterAndSaveEvenNumbers(numbers);

module.exports = { filterAndSaveEvenNumbers };