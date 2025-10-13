const fs = require('fs');
const path = require('path');
const { filterEvenNumbers } = require('./filter_even');

/**
 * Saves data to a file with a random name in the specified directory.
 * @param {any} data - The data to save.
 * @param {string} dir - The directory to save the file in. Defaults to current directory.
 * @param {string} extension - The file extension. Defaults to '.txt'.
 * @returns {string} The full path of the created file.
 */
function saveToRandomFile(data, dir = '.', extension = '.txt') {
  const randomFileName = `random_file_${Math.floor(Math.random() * 1000000)}${extension}`;
  const filePath = path.join(dir, randomFileName);
  fs.writeFileSync(filePath, JSON.stringify(data, null, 2));
  console.log(`Data saved to random file: ${filePath}`);
  return filePath;
}

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);

const savedFilePath = saveToRandomFile(evenNumbers, '/workspace', '.json');
