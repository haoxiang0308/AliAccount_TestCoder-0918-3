import React, { useState } from 'react';

const MyComponent: React.FC = () => {
  const [count, setCount] = useState(0);

  return (
    <div>
      <h1>My Component</h1>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
};

export default MyComponent;