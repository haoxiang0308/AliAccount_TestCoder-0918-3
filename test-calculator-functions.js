// test-calculator-functions.js - Mocha tests for calculator module

const chai = require('chai');
const { add, subtract, multiply, divide } = require('./calculator');

const { expect } = chai;

describe('Calculator Functions', function() {
  describe('add()', function() {
    it('should add two positive numbers correctly', function() {
      const result = add(2, 3);
      expect(result).to.equal(5);
    });

    it('should add negative numbers correctly', function() {
      const result = add(-2, -3);
      expect(result).to.equal(-5);
    });

    it('should handle adding zero', function() {
      const result = add(5, 0);
      expect(result).to.equal(5);
    });
  });

  describe('subtract()', function() {
    it('should subtract two positive numbers correctly', function() {
      const result = subtract(5, 3);
      expect(result).to.equal(2);
    });

    it('should handle negative results', function() {
      const result = subtract(3, 5);
      expect(result).to.equal(-2);
    });
  });

  describe('multiply()', function() {
    it('should multiply two positive numbers correctly', function() {
      const result = multiply(3, 4);
      expect(result).to.equal(12);
    });

    it('should handle multiplication by zero', function() {
      const result = multiply(5, 0);
      expect(result).to.equal(0);
    });

    it('should handle negative numbers', function() {
      const result = multiply(-3, 4);
      expect(result).to.equal(-12);
    });
  });

  describe('divide()', function() {
    it('should divide two positive numbers correctly', function() {
      const result = divide(8, 2);
      expect(result).to.equal(4);
    });

    it('should handle decimal results', function() {
      const result = divide(7, 2);
      expect(result).to.equal(3.5);
    });

    it('should throw an error when dividing by zero', function() {
      expect(() => divide(5, 0)).to.throw('Division by zero is not allowed');
    });
  });
});