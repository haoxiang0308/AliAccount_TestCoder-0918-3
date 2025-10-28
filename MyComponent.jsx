import React from 'react';

const MyComponent = ({ title, children }) => {
  return (
    <div className="my-component">
      <h1>{title}</h1>
      <div>{children}</div>
    </div>
  );
};

export default MyComponent;