// Function to filter even numbers from an array
function filterEvenNumbers(arr) {
    return arr.filter(num => num % 2 === 0);
}

// Function to generate a random filename
function generateRandomFilename(extension = '.txt') {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    for (let i = 0; i < 10; i++) {
        result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return result + extension;
}

// Function to save array to a randomly named file
function saveEvenNumbersToFile(inputArray) {
    const evenNumbers = filterEvenNumbers(inputArray);
    const randomFilename = generateRandomFilename('.js');
    
    // Convert the array to a string for saving to file
    const fileContent = `// Array of even numbers filtered from input array
const evenNumbers = [${evenNumbers.join(', ')}];

module.exports = { evenNumbers };
`;
    
    // Using Node.js file system to write the file
    const fs = require('fs');
    fs.writeFileSync(randomFilename, fileContent);
    
    console.log(`Even numbers filtered from [${inputArray}]`);
    console.log(`Result saved to ${randomFilename}: [${evenNumbers}]`);
    
    return randomFilename;
}

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
saveEvenNumbersToFile(numbers);

// Export the main function
module.exports = { filterEvenNumbers, saveEvenNumbersToFile };