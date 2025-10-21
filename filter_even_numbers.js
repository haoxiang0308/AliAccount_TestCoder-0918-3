// Function to filter even numbers from an array and save to a randomly named file
const fs = require('fs');
const path = require('path');

function filterAndSaveEvenNumbers(inputArray) {
    // Validate input
    if (!Array.isArray(inputArray)) {
        throw new Error('Input must be an array');
    }
    
    // Filter even numbers from the input array
    const evenNumbers = inputArray.filter(num => {
        // Check if the element is a number before filtering
        return typeof num === 'number' && num % 2 === 0;
    });
    
    // Generate a random filename
    const randomFileName = `even_numbers_${Date.now()}_${Math.floor(Math.random() * 10000)}.json`;
    const filePath = path.join(__dirname, randomFileName);
    
    try {
        // Save the even numbers to the file
        fs.writeFileSync(filePath, JSON.stringify(evenNumbers, null, 2));
        
        console.log(`Even numbers filtered and saved to: ${filePath}`);
        console.log('Filtered even numbers:', evenNumbers);
        
        return {
            fileName: randomFileName,
            filePath: filePath,
            evenNumbers: evenNumbers
        };
    } catch (error) {
        console.error('Error writing to file:', error);
        throw error;
    }
}

// Example usage
console.log('Testing the function with an example array:');
const testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
filterAndSaveEvenNumbers(testArray);

// Additional example with mixed array
console.log('\nTesting with a mixed array including non-numbers:');
const mixedArray = [1, 2, 'hello', 4, null, 6, undefined, 8, 9.5, 10];
filterAndSaveEvenNumbers(mixedArray);

module.exports = { filterAndSaveEvenNumbers };