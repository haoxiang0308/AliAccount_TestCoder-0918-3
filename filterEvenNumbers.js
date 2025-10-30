// Function to filter even numbers from an array and save to a random named file
const fs = require('fs');
const path = require('path');

function filterAndSaveEvenNumbers(numbers) {
  try {
    // Validate input
    if (!Array.isArray(numbers)) {
      throw new Error('Input must be an array');
    }
    
    // Filter even numbers from the array
    const evenNumbers = numbers.filter(num => {
      // Check if the element is a number
      if (typeof num !== 'number' || isNaN(num)) {
        console.warn(`Warning: Non-numeric value "${num}" found in array, skipping...`);
        return false;
      }
      return num % 2 === 0;
    });
    
    // Generate a random filename with timestamp for more uniqueness
    const timestamp = Date.now();
    const randomSuffix = Math.floor(Math.random() * 1000000);
    const randomFileName = `even_numbers_${timestamp}_${randomSuffix}.json`;
    const filePath = path.join(__dirname, randomFileName);
    
    // Save the even numbers to the file
    fs.writeFileSync(filePath, JSON.stringify(evenNumbers, null, 2));
    
    console.log(`Even numbers filtered and saved to: ${filePath}`);
    console.log('Even numbers:', evenNumbers);
    
    return {
      evenNumbers,
      fileName: randomFileName,
      filePath
    };
  } catch (error) {
    console.error('Error in filterAndSaveEvenNumbers:', error.message);
    throw error;
  }
}

// Example usage
const testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
filterAndSaveEvenNumbers(testArray);

// Example with mixed array including non-numeric values
const mixedArray = [1, 2, 3, 4, 'hello', 5, 6, 7, 8, null, 10];
console.log('\nTesting with mixed array:');
filterAndSaveEvenNumbers(mixedArray);

module.exports = { filterAndSaveEvenNumbers };