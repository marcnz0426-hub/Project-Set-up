// Example test file for the AI Project Starter template.
// Replace with your actual test framework (Jest, Vitest, pytest, etc.)
// and test files. This file exists to demonstrate the expected structure.
//
// How to run: npm test  (or the project's test command)

const assert = require('node:assert');

function add(a, b) {
  return a + b;
}

describe('example', () => {
  it('should add two numbers', () => {
    assert.strictEqual(add(1, 2), 3);
  });

  it('should handle negative numbers', () => {
    assert.strictEqual(add(-1, 1), 0);
  });

  it('should handle zero', () => {
    assert.strictEqual(add(0, 0), 0);
  });
});
