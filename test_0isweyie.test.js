import React from 'react';
import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders title and description correctly', () => {
    const title = 'Test Title';
    const description = 'Test Description';
    
    render(<MyComponent title={title} description={description} />);
    
    // Check if the title is rendered
    expect(screen.getByText(title)).toBeInTheDocument();
    
    // Check if the description is rendered
    expect(screen.getByText(description)).toBeInTheDocument();
  });

  test('renders with empty props gracefully', () => {
    render(<MyComponent title="" description="" />);
    
    // Check if the component renders without crashing
    expect(screen.getByRole('document')).toBeInTheDocument();
  });

  test('matches snapshot', () => {
    const { container } = render(<MyComponent title="Snapshot Title" description="Snapshot Description" />);
    expect(container).toMatchSnapshot();
  });
});