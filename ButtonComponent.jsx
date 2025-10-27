import React from 'react';

const ButtonComponent = ({ onClick, children, variant = 'primary' }) => {
  const buttonStyles = {
    primary: {
      backgroundColor: '#007bff',
      color: 'white',
      border: 'none',
      padding: '10px 20px',
      borderRadius: '4px',
    },
    secondary: {
      backgroundColor: '#6c757d',
      color: 'white',
      border: 'none',
      padding: '10px 20px',
      borderRadius: '4px',
    },
  };

  return (
    <button 
      style={buttonStyles[variant]} 
      onClick={onClick}
    >
      {children}
    </button>
  );
};

export default ButtonComponent;