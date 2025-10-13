import { useState } from 'react';

/**
 * A custom React Hook that manages a counter state.
 * @param {number} initialValue - The initial value for the counter. Defaults to 0.
 * @returns {Object} An object containing the count, increment, decrement, and reset functions.
 */
export const useCounter = (initialValue = 0) => {
  const [count, setCount] = useState(initialValue);

  const increment = () => setCount(prevCount => prevCount + 1);
  const decrement = () => setCount(prevCount => prevCount - 1);
  const reset = () => setCount(initialValue);

  return { count, increment, decrement, reset };
};
