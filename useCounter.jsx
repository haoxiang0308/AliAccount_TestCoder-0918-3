import { useState } from 'react';

// A custom hook that manages a counter state
function useCounter(initialValue = 0) {
  const [count, setCount] = useState(initialValue);

  const increment = () => setCount(prevCount => prevCount + 1);
  const decrement = () => setCount(prevCount => prevCount - 1);
  const reset = () => setCount(initialValue);

  return {
    count,
    increment,
    decrement,
    reset
  };
}

export default useCounter;