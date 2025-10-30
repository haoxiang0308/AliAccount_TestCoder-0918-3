const { expect } = require('chai');
const { add, subtract, multiply } = require('./calculate');

describe('Calculate functions', function() {
    describe('Add function', function() {
        it('should add two positive numbers correctly', function() {
            const result = add(2, 3);
            expect(result).to.equal(5);
        });

        it('should add negative numbers correctly', function() {
            const result = add(-2, -3);
            expect(result).to.equal(-5);
        });

        it('should add positive and negative numbers correctly', function() {
            const result = add(5, -3);
            expect(result).to.equal(2);
        });
    });

    describe('Subtract function', function() {
        it('should subtract two positive numbers correctly', function() {
            const result = subtract(5, 3);
            expect(result).to.equal(2);
        });

        it('should subtract when result is negative', function() {
            const result = subtract(3, 5);
            expect(result).to.equal(-2);
        });

        it('should subtract negative numbers correctly', function() {
            const result = subtract(-5, -3);
            expect(result).to.equal(-2);
        });
    });

    describe('Multiply function', function() {
        it('should multiply two positive numbers correctly', function() {
            const result = multiply(3, 4);
            expect(result).to.equal(12);
        });

        it('should multiply with negative numbers correctly', function() {
            const result = multiply(-3, 4);
            expect(result).to.equal(-12);
        });

        it('should multiply two negative numbers correctly', function() {
            const result = multiply(-3, -4);
            expect(result).to.equal(12);
        });
    });
});