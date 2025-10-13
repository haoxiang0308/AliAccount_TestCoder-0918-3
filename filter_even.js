/**
 * Filters even numbers from an array of integers.
 * @param {number[]} array - The input array of integers.
 * @returns {number[]} A new array containing only the even numbers.
 */
function filterEvenNumbers(array) {
  if (!Array.isArray(array)) {
    throw new Error("Input must be an array.");
  }
  return array.filter(num => {
    // Check if the element is a number and is even
    if (typeof num !== 'number' || !Number.isInteger(num)) {
      console.warn(`Non-integer value ${num} encountered, skipping.`);
      return false;
    }
    return num % 2 === 0;
  });
}

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);
console.log("Original array:", numbers);
console.log("Filtered even numbers:", evenNumbers);

module.exports = { filterEvenNumbers };
