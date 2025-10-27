const { expect } = require('chai');
const { addNumbers } = require('./testedFunction');

describe('addNumbers function', function() {
    it('should add two positive numbers correctly', function() {
        const result = addNumbers(2, 3);
        expect(result).to.equal(5);
    });

    it('should add two negative numbers correctly', function() {
        const result = addNumbers(-2, -3);
        expect(result).to.equal(-5);
    });

    it('should add a positive and a negative number correctly', function() {
        const result = addNumbers(5, -3);
        expect(result).to.equal(2);
    });

    it('should handle decimal numbers correctly', function() {
        const result = addNumbers(1.5, 2.5);
        expect(result).to.equal(4);
    });

    it('should return 0 when adding 0 to 0', function() {
        const result = addNumbers(0, 0);
        expect(result).to.equal(0);
    });
});