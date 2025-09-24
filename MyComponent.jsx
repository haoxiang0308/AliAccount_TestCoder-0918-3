import React from 'react';

const MyComponent = ({ name = 'World' }) => {
  return <div>Hello, {name}!</div>;
};

export default MyComponent;