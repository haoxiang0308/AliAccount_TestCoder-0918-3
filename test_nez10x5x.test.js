import React from 'react';
import { render, screen } from '@testing-library/react';
import ExampleComponent from './ExampleComponent';

describe('ExampleComponent', () => {
  test('renders title and description correctly', () => {
    const title = 'Test Title';
    const description = 'Test Description';
    
    render(<ExampleComponent title={title} description={description} />);
    
    expect(screen.getByText(title)).toBeInTheDocument();
    expect(screen.getByText(description)).toBeInTheDocument();
  });

  test('renders different content with different props', () => {
    const title = 'Another Title';
    const description = 'Another Description';
    
    render(<ExampleComponent title={title} description={description} />);
    
    expect(screen.getByText(title)).toBeInTheDocument();
    expect(screen.getByText(description)).toBeInTheDocument();
  });

  test('handles empty props gracefully', () => {
    render(<ExampleComponent title="" description="" />);
    
    expect(screen.getByText('')).toBeInTheDocument();
  });
});