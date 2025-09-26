// Function to filter even numbers from an array
function filterEvenNumbers(arr) {
    return arr.filter(num => num % 2 === 0);
}

// Example usage
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);
console.log("Original array:", numbers);
console.log("Even numbers:", evenNumbers);

// Function to save data to a randomly named file
function saveToFile(data) {
    const fs = require('fs');
    const os = require('os');
    const path = require('path');

    // Generate a random filename
    const randomFileName = path.join(os.tmpdir(), `even_numbers_${Math.random().toString(36).substring(2, 10)}.json`);

    // Write the data to the file
    fs.writeFileSync(randomFileName, JSON.stringify(data, null, 2));
    console.log(`Data saved to randomly named file: ${randomFileName}`);
    return randomFileName;
}

// Save the filtered even numbers to a file
const savedFileName = saveToFile(evenNumbers);