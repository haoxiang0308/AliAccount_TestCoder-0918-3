function getSum(num1, num2) {
  return num1 + num2;
}

// Для использования в Node.js
if (typeof module !== "undefined" && module.exports) {
  module.exports = getSum;
}