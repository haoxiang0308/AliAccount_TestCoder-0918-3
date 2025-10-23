import React from 'react';
import { render, screen } from '@testing-library/react';
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
    const { rerender } = render(<MyComponent title="First Title" description="First Description" />);
    
    expect(screen.getByText('First Title')).toBeInTheDocument();
    expect(screen.getByText('First Description')).toBeInTheDocument();
    
    rerender(<MyComponent title="Second Title" description="Second Description" />);
    
    expect(screen.getByText('Second Title')).toBeInTheDocument();
    expect(screen.getByText('Second Description')).toBeInTheDocument();
  });

  test('matches snapshot', () => {
    const { asFragment } = render(<MyComponent title="Snapshot Title" description="Snapshot Description" />);
    expect(asFragment()).toMatchSnapshot();
  });
});