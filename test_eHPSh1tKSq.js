// test_eHPSh1tKSq.js - Mocha tests for calculator module

const { add, subtract, multiply, divide } = require('./calculator');

// Using dynamic import for Chai
let expect;
before(async function() {
  const chai = await import('chai');
  expect = chai.expect;
});

describe('Calculator Tests', function() {
  describe('add()', function() {
    it('should add two positive numbers correctly', function() {
      const result = add(2, 3);
      expect(result).to.equal(5);
    });

    it('should add negative numbers correctly', function() {
      const result = add(-2, -3);
      expect(result).to.equal(-5);
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

    it('should multiply by zero correctly', function() {
      const result = multiply(5, 0);
      expect(result).to.equal(0);
    });
  });

  describe('divide()', function() {
    it('should divide two positive numbers correctly', function() {
      const result = divide(8, 2);
      expect(result).to.equal(4);
    });

    it('should throw an error when dividing by zero', function() {
      expect(() => divide(5, 0)).to.throw('Division by zero is not allowed');
    });
  });
});