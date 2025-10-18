const { expect } = require('chai');
const { addNumbers } = require('./testedFunction');

describe('addNumbers function', () => {
  it('should add two positive numbers correctly', () => {
    const result = addNumbers(2, 3);
    expect(result).to.equal(5);
  });

  it('should add two negative numbers correctly', () => {
    const result = addNumbers(-2, -3);
    expect(result).to.equal(-5);
  });

  it('should add a positive and a negative number correctly', () => {
    const result = addNumbers(5, -3);
    expect(result).to.equal(2);
  });

  it('should add zero to a number correctly', () => {
    const result = addNumbers(7, 0);
    expect(result).to.equal(7);
  });

  it('should throw an error when first argument is not a number', () => {
    expect(() => addNumbers('2', 3)).to.throw('Both arguments must be numbers');
  });

  it('should throw an error when second argument is not a number', () => {
    expect(() => addNumbers(2, '3')).to.throw('Both arguments must be numbers');
  });

  it('should throw an error when both arguments are not numbers', () => {
    expect(() => addNumbers('2', '3')).to.throw('Both arguments must be numbers');
  });
});