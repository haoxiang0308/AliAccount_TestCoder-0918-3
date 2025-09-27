const { filterEvenNumbers } = require('./filter_even');
const { v4: uuidv4 } = require('uuid');

// Function to save data to a file with a random name
function saveToRandomFile(data, prefix = 'output') {
  const fs = require('fs');
  const fileName = `${prefix}_${uuidv4()}.json`;
  fs.writeFileSync(fileName, JSON.stringify(data, null, 2));
  console.log(`Data saved to ${fileName}`);
  return fileName;
}

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);

saveToRandomFile(evenNumbers, 'even_numbers');
