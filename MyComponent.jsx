import React from 'react';

const MyComponent = ({ name, items = [] }) => {
  return (
    <div>
      <h1>Hello, {name}!</h1>
      <ul>
        {items.map((item, index) => (
          <li key={index}>{item}</li>
        ))}
      </ul>
    </div>
  );
};

export default MyComponent;