// test_1zDXvhy3fF.js - Mocha tests for calculator module

import { add, subtract, multiply, divide } from './calculator.js';
import { expect } from 'chai';

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
    it('should subtract two numbers correctly', function() {
      const result = subtract(5, 3);
      expect(result).to.equal(2);
    });
  });

  describe('multiply()', function() {
    it('should multiply two numbers correctly', function() {
      const result = multiply(3, 4);
      expect(result).to.equal(12);
    });
  });

  describe('divide()', function() {
    it('should divide two numbers correctly', function() {
      const result = divide(8, 2);
      expect(result).to.equal(4);
    });

    it('should throw an error when dividing by zero', function() {
      expect(() => divide(8, 0)).to.throw('Division by zero is not allowed');
    });
  });
});