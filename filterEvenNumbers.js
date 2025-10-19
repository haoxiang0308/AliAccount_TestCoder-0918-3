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

// Function to save filtered even numbers to a randomly named file
function saveEvenNumbersToFile(arr, outputDir = '/workspace') {
    const evenNumbers = filterEvenNumbers(arr);
    const randomFilename = generateRandomFilename('.json'); // Using .json to store array properly
    const filePath = `${outputDir}/${randomFilename}`;
    
    // Convert array to JSON string
    const dataToSave = JSON.stringify(evenNumbers);
    
    // Write to file using Node.js fs module
    const fs = require('fs');
    fs.writeFileSync(filePath, dataToSave);
    
    console.log(`Filtered even numbers saved to: ${filePath}`);
    console.log('Even numbers:', evenNumbers);
    
    return filePath;
}

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
saveEvenNumbersToFile(numbers);