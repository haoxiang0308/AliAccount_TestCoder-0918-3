// Function to filter even numbers from an array
function filterEvenNumbers(arr) {
    return arr.filter(num => num % 2 === 0);
}

// Function to generate a random filename
function generateRandomFilename(extension = '.txt') {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    const maxLength = 10;
    
    for (let i = 0; i < maxLength; i++) {
        result += characters.charAt(Math.floor(Math.random() * characters.length));
    }
    
    return result + extension;
}

// Function to save filtered even numbers to a randomly named file
function saveEvenNumbersToFile(arr, outputDir = '/workspace') {
    const evenNumbers = filterEvenNumbers(arr);
    const randomFilename = generateRandomFilename('.json'); // Using .json to store the array
    const filePath = `${outputDir}/${randomFilename}`;
    
    const fs = require('fs');
    
    // Write the even numbers array to the randomly named file
    fs.writeFileSync(filePath, JSON.stringify(evenNumbers), 'utf8');
    
    console.log(`Filtered even numbers saved to: ${filePath}`);
    console.log(`Even numbers: [${evenNumbers.join(', ')}]`);
    
    return filePath;
}

// Example usage
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
saveEvenNumbersToFile(numbers);

// Export the functions for potential use in other modules
module.exports = {
    filterEvenNumbers,
    saveEvenNumbersToFile,
    generateRandomFilename
};