const { expect } = require('chai');
const { add } = require('../src/mathFunctions');

describe('Math Functions', () => {
  describe('add', () => {
    it('should add two numbers correctly', () => {
      const result = add(2, 3);
      expect(result).to.equal(5);
    });

    it('should handle negative numbers', () => {
      const result = add(-1, 1);
      expect(result).to.equal(0);
    });
  });
});