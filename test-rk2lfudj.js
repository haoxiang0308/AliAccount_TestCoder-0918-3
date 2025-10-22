const { addNumbers } = require('./test-function');
const { expect } = require('chai');

// Mocha test suite for the addNumbers function
describe('addNumbers function', () => {
    // Test case for adding positive numbers
    it('should return the sum of two positive numbers', () => {
        const result = addNumbers(2, 3);
        expect(result).to.equal(5);
    });

    // Test case for adding negative numbers
    it('should return the sum of two negative numbers', () => {
        const result = addNumbers(-2, -3);
        expect(result).to.equal(-5);
    });

    // Test case for adding a positive and negative number
    it('should return the sum when one number is negative', () => {
        const result = addNumbers(5, -3);
        expect(result).to.equal(2);
    });

    // Test case for adding zero
    it('should handle adding with zero', () => {
        const result = addNumbers(42, 0);
        expect(result).to.equal(42);
    });

    // Test case for decimal numbers
    it('should work with decimal numbers', () => {
        const result = addNumbers(2.5, 3.7);
        expect(result).to.equal(6.2);
    });
});