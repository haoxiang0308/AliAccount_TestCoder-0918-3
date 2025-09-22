// Function to generate Fibonacci sequence up to n terms
function fibonacci(n) {
  if (n <= 0) {
    console.log("Please enter a positive integer");
    return;
  }
  
  if (n === 1) {
    console.log([0]);
    return [0];
  }
  
  if (n === 2) {
    console.log([0, 1]);
    return [0, 1];
  }
  
  const fibSequence = [0, 1];
  
  for (let i = 2; i < n; i++) {
    const nextFib = fibSequence[i - 1] + fibSequence[i - 2];
    fibSequence.push(nextFib);
  }
  
  console.log(fibSequence);
  return fibSequence;
}

module.exports = { fibonacci };

// Example usage:
// fibonacci(10);