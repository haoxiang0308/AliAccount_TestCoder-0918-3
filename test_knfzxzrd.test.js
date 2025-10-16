import React from 'react';
import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders the name prop correctly', () => {
    render(<MyComponent name="John" age={25} />);
    
    const headingElement = screen.getByText(/Hello, John!/i);
    expect(headingElement).toBeInTheDocument();
  });

  test('renders the age prop correctly', () => {
    render(<MyComponent name="Jane" age={30} />);
    
    const paragraphElement = screen.getByText(/You are 30 years old./i);
    expect(paragraphElement).toBeInTheDocument();
  });

  test('renders different values correctly', () => {
    render(<MyComponent name="Alice" age={28} />);
    
    expect(screen.getByText(/Hello, Alice!/i)).toBeInTheDocument();
    expect(screen.getByText(/You are 28 years old./i)).toBeInTheDocument();
  });
});