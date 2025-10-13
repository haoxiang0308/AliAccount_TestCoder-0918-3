const { expect } = require('chai');
const { add, subtract } = require('../src/mathFunctions');

describe('Math Functions', () => {
  describe('add', () => {
    it('should return the sum of two numbers', () => {
      expect(add(2, 3)).to.equal(5);
    });

    it('should return the correct sum with negative numbers', () => {
      expect(add(-1, 1)).to.equal(0);
      expect(add(-5, -3)).to.equal(-8);
    });
  });

  describe('subtract', () => {
    it('should return the difference of two numbers', () => {
      expect(subtract(5, 3)).to.equal(2);
    });

    it('should return the correct difference with negative numbers', () => {
      expect(subtract(-1, 1)).to.equal(-2);
      expect(subtract(-5, -3)).to.equal(-2);
    });
  });
});