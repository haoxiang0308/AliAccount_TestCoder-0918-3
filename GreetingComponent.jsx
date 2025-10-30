import React from 'react';

const GreetingComponent = ({ name = 'Guest', greeting = 'Hello' }) => {
  return (
    <div>
      <h1>{greeting}, {name}!</h1>
    </div>
  );
};

export default GreetingComponent;