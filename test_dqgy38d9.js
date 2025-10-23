const { expect } = require('chai');
const { addNumbers, capitalize } = require('./utils');

describe('Utility Functions', () => {
    describe('addNumbers', () => {
        it('should add two positive numbers correctly', () => {
            const result = addNumbers(2, 3);
            expect(result).to.equal(5);
        });

        it('should add two negative numbers correctly', () => {
            const result = addNumbers(-2, -3);
            expect(result).to.equal(-5);
        });

        it('should add a positive and negative number correctly', () => {
            const result = addNumbers(5, -3);
            expect(result).to.equal(2);
        });

        it('should throw an error when first argument is not a number', () => {
            expect(() => addNumbers('2', 3)).to.throw('Both arguments must be numbers');
        });

        it('should throw an error when second argument is not a number', () => {
            expect(() => addNumbers(2, '3')).to.throw('Both arguments must be numbers');
        });
    });

    describe('capitalize', () => {
        it('should capitalize the first letter of a string', () => {
            const result = capitalize('hello');
            expect(result).to.equal('Hello');
        });

        it('should handle a string that is already capitalized', () => {
            const result = capitalize('World');
            expect(result).to.equal('World');
        });

        it('should handle a single character string', () => {
            const result = capitalize('a');
            expect(result).to.equal('A');
        });

        it('should throw an error when argument is not a string', () => {
            expect(() => capitalize(123)).to.throw('Argument must be a string');
        });

        it('should handle an empty string', () => {
            const result = capitalize('');
            expect(result).to.equal('');
        });
    });
});