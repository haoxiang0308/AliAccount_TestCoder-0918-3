import React from 'react';

const MyComponent = ({ title, description }) => {
  return (
    <div className="my-component">
      <h1>{title}</h1>
      <p>{description}</p>
    </div>
  );
};

export default MyComponent;