const { add } = require('./utils.js');

const assert = require('assert');

describe('Utils', function() {
  describe('#add()', function() {
    it('should return the sum of two numbers', function() {
      assert.strictEqual(add(1, 2), 3);
      assert.strictEqual(add(-1, 1), 0);
      assert.strictEqual(add(0, 0), 0);
    });
  });
});