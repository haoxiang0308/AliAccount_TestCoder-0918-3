import React from 'react';

const MyButton = ({ onClick, children, disabled = false }) => {
  return (
    <button onClick={onClick} disabled={disabled}>
      {children}
    </button>
  );
};

export default MyButton;