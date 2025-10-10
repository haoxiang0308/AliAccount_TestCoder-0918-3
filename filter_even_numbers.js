// Function to filter even numbers from an array
function filterEvenNumbers(inputArray) {
    return inputArray.filter(num => num % 2 === 0);
}

// Function to save data to a file with a random name
const fs = require('fs');
const path = require('path');

function saveToFile(data) {
    // Generate a random filename
    const randomFileName = `output_${Math.floor(Math.random() * 1000000)}.json`;
    const filePath = path.join('/workspace', randomFileName);

    // Write the data to the file
    fs.writeFileSync(filePath, JSON.stringify(data, null, 2));
    console.log(`Data saved to ${filePath}`);
}

// Example usage
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);
console.log("Original array:", numbers);
console.log("Even numbers:", evenNumbers);

// Save the filtered array to a randomly named file
saveToFile(evenNumbers);

// Export the functions for potential reuse
module.exports = { filterEvenNumbers, saveToFile };
