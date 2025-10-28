import React from 'react';
import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders title and children correctly', () => {
    const title = 'Test Title';
    const children = 'Test Children Content';
    
    render(<MyComponent title={title}>{children}</MyComponent>);
    
    // Check if the title is rendered
    expect(screen.getByText(title)).toBeInTheDocument();
    
    // Check if the children content is rendered
    expect(screen.getByText(children)).toBeInTheDocument();
    
    // Check if the component has the correct class
    expect(screen.getByText(title).closest('.my-component')).toBeInTheDocument();
  });

  test('renders different title and children', () => {
    render(<MyComponent title="Another Title">More content here</MyComponent>);
    
    expect(screen.getByText('Another Title')).toBeInTheDocument();
    expect(screen.getByText('More content here')).toBeInTheDocument();
  });

  test('handles empty children properly', () => {
    render(<MyComponent title="Empty Children Title"></MyComponent>);
    
    expect(screen.getByText('Empty Children Title')).toBeInTheDocument();
  });
});