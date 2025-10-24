import { useState } from 'react';

// A custom hook that manages a counter state
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

  const update = (newValue) => {
    setCount(newValue);
  };

  return {
    count,
    increment,
    decrement,
    reset,
    update
  };
};

export default useCounter;