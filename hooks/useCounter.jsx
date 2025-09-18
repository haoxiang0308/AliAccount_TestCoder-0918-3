import { useState } from 'react';

/**
 * A custom React hook for managing a simple counter state.
 * 
 * @param {number} initialValue - The initial value for the counter. Defaults to 0.
 * @returns {Object} An object containing the current count and functions to increment, decrement, and reset the counter.
 */
const useCounter = (initialValue = 0) => {
  const [count, setCount] = useState(initialValue);

  const increment = () => setCount(count + 1);
  const decrement = () => setCount(count - 1);
  const reset = () => setCount(initialValue);

  return { count, increment, decrement, reset };
};

export default useCounter;