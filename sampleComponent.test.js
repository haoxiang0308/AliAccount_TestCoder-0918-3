import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import SampleComponent from './SampleComponent';

describe('SampleComponent', () => {
  test('renders the component with the correct name', () => {
    render(<SampleComponent name="John" />);
    
    const headingElement = screen.getByText(/Hello, John!/i);
    expect(headingElement).toBeInTheDocument();
  });

  test('calls onClick handler when button is clicked', () => {
    const mockOnClick = jest.fn();
    render(<SampleComponent name="Jane" onClick={mockOnClick} />);
    
    const buttonElement = screen.getByText(/Click me/i);
    fireEvent.click(buttonElement);
    
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });

  test('displays the correct name in the heading', () => {
    render(<SampleComponent name="Alice" />);
    
    const headingElement = screen.getByText('Hello, Alice!');
    expect(headingElement).toBeInTheDocument();
  });
});