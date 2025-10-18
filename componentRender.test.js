import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders title and description correctly', () => {
    const title = 'Test Title';
    const description = 'Test Description';
    
    render(<MyComponent title={title} description={description} />);
    
    expect(screen.getByText(title)).toBeInTheDocument();
    expect(screen.getByText(description)).toBeInTheDocument();
  });

  test('renders different content with different props', () => {
    const title = 'Another Title';
    const description = 'Another Description';
    
    render(<MyComponent title={title} description={description} />);
    
    expect(screen.getByText(title)).toBeInTheDocument();
    expect(screen.getByText(description)).toBeInTheDocument();
  });

  test('handles empty strings as props', () => {
    render(<MyComponent title="" description="" />);
    
    expect(screen.getByText('')).toBeInTheDocument();
  });
});