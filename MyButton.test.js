import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import MyButton from './MyButton';

describe('MyButton Component', () => {
  test('renders the button with the correct label', () => {
    const label = 'Click Me';
    render(<MyButton label={label} />);
    expect(screen.getByText(label)).toBeInTheDocument();
  });

  test('calls the onClick handler when clicked', () => {
    const mockOnClick = jest.fn();
    const label = 'Submit';
    render(<MyButton label={label} onClick={mockOnClick} />);
    
    fireEvent.click(screen.getByText(label));
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });

  test('is disabled when the disabled prop is true', () => {
    const label = 'Disabled Button';
    render(<MyButton label={label} disabled={true} />);
    
    const button = screen.getByText(label);
    expect(button).toBeDisabled();
  });
});