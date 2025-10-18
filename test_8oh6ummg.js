const { addNumbers } = require('./utils');

// Mocha test for the addNumbers function
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

  it('should throw an error when first argument is not a number', () => {
    expect(() => {
      addNumbers('2', 3);
    }).to.throw('Both arguments must be numbers');
  });

  it('should throw an error when second argument is not a number', () => {
    expect(() => {
      addNumbers(2, '3');
    }).to.throw('Both arguments must be numbers');
  });

  it('should handle decimal numbers correctly', () => {
    const result = addNumbers(2.5, 3.7);
    expect(result).to.equal(6.2);
  });
});