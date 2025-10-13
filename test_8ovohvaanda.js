const { add } = require('./add');

const assert = require('assert');

describe('Add Function', function() {
  it('should add two positive numbers correctly', function() {
    assert.strictEqual(add(2, 3), 5);
  });

  it('should add two negative numbers correctly', function() {
    assert.strictEqual(add(-2, -3), -5);
  });

  it('should add a positive and a negative number correctly', function() {
    assert.strictEqual(add(5, -3), 2);
  });

  it('should throw an error if the first argument is not a number', function() {
    assert.throws(() => add('a', 2), Error);
  });

  it('should throw an error if the second argument is not a number', function() {
    assert.throws(() => add(2, null), Error);
  });
});