const { expect } = require('chai');
const { add, subtract } = require('./utils');

describe('Utility Functions', function() {
  describe('add function', function() {
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

    it('should throw an error when first argument is not a number', function() {
      expect(() => add('2', 3)).to.throw('Both arguments must be numbers');
    });

    it('should throw an error when second argument is not a number', function() {
      expect(() => add(2, '3')).to.throw('Both arguments must be numbers');
    });
  });

  describe('subtract function', function() {
    it('should subtract two positive numbers correctly', function() {
      const result = subtract(5, 3);
      expect(result).to.equal(2);
    });

    it('should subtract negative numbers correctly', function() {
      const result = subtract(-5, -3);
      expect(result).to.equal(-2);
    });

    it('should throw an error when first argument is not a number', function() {
      expect(() => subtract('5', 3)).to.throw('Both arguments must be numbers');
    });

    it('should throw an error when second argument is not a number', function() {
      expect(() => subtract(5, '3')).to.throw('Both arguments must be numbers');
    });
  });
});