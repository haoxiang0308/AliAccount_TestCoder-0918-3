const { filterEvenNumbers } = require('./filter_even.js');
const fs = require('fs');
const path = require('path');

// Get input array from command line arguments, e.g., node save_to_file.js 1 2 3 4 5
const inputArray = process.argv.slice(2).map(arg => parseInt(arg)).filter(num => !isNaN(num));

const evenNumbers = filterEvenNumbers(inputArray);

// Generate a random filename
const randomFileName = `even_numbers_output_${Math.floor(Math.random() * 1000000)}.json`;

// Define the full path
const filePath = path.join('/workspace', randomFileName);

// Write the result to the file
fs.writeFileSync(filePath, JSON.stringify(evenNumbers, null, 2));

console.log(`Filtered even numbers saved to file: ${filePath}`);
