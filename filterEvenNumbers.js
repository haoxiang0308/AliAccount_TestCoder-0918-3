// Function to filter even numbers from an array and save to a random named file
function filterAndSaveEvenNumbers(numbers) {
    // Filter even numbers from the input array
    const evenNumbers = numbers.filter(num => num % 2 === 0);
    
    // Generate a random filename
    const randomFileName = `evenNumbers_${Math.floor(Math.random() * 1000000)}.json`;
    
    // Convert the array to JSON string
    const jsonString = JSON.stringify(evenNumbers);
    
    // Write to file using Node.js fs module
    const fs = require('fs');
    fs.writeFileSync(randomFileName, jsonString);
    
    console.log(`Even numbers saved to: ${randomFileName}`);
    console.log(`Filtered even numbers: [${evenNumbers.join(', ')}]`);
    
    return randomFileName;
}

// Example usage
const testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
const savedFileName = filterAndSaveEvenNumbers(testArray);

module.exports = { filterAndSaveEvenNumbers };