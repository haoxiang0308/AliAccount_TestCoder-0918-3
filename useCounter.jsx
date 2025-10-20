import { useState } from 'react';

/**
 * A custom React hook that manages a counter state
 * @param {number} initialValue - The initial value for the counter (default is 0)
 * @returns {object} An object containing the count value and control functions
 */
const useCounter = (initialValue = 0) => {
  const [count, setCount] = useState(initialValue);

  const increment = () => {
    setCount(prevCount => prevCount + 1);
  };

  const decrement = () => {
    setCount(prevCount => prevCount - 1);
  };

  const reset = () => {
    setCount(initialValue);
  };

  const setValue = (value) => {
    setCount(value);
  };

  return {
    count,
    increment,
    decrement,
    reset,
    setValue
  };
};

export default useCounter;