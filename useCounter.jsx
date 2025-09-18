import { useState } from 'react';

/**
 * A custom React hook for a simple counter.
 * @returns {Object} An object containing the count state and functions to increment, decrement, and reset the counter.
 */
export const useCounter = (initialValue = 0) => {
  const [count, setCount] = useState(initialValue);

  const increment = () => {
    setCount(count + 1);
  };

  const decrement = () => {
    setCount(count - 1);
  };

  const reset = () => {
    setCount(initialValue);
  };

  return { count, increment, decrement, reset };
};