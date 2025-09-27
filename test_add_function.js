const { add } = require('./test_function');

describe('Add Function', () => {
  it('should add two positive numbers correctly', () => {
    const result = add(2, 3);
    expect(result).to.equal(5);
  });

  it('should add two negative numbers correctly', () => {
    const result = add(-2, -3);
    expect(result).to.equal(-5);
  });

  it('should add a positive and a negative number correctly', () => {
    const result = add(5, -3);
    expect(result).to.equal(2);
  });

  it('should throw an error if the first argument is not a number', () => {
    expect(() => add('2', 3)).to.throw('Both arguments must be numbers');
  });

  it('should throw an error if the second argument is not a number', () => {
    expect(() => add(2, '3')).to.throw('Both arguments must be numbers');
  });

  it('should throw an error if both arguments are not numbers', () => {
    expect(() => add('2', '3')).to.throw('Both arguments must be numbers');
  });
});