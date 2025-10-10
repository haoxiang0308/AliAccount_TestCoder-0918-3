import React from 'react';

const MyComponent = ({ name = 'World' }) => {
  return <h1>Hello, {name}!</h1>;
};

export default MyComponent;