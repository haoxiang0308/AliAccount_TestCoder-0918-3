import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import '@testing-library/jest-dom';
import MyButton from './MyButton';

describe('MyButton', () => {
  test('renders button with children text', () => {
    render(<MyButton>Click Me</MyButton>);
    expect(screen.getByText(/click me/i)).toBeInTheDocument();
  });

  test('calls onClick handler when clicked', () => {
    const mockOnClick = jest.fn();
    render(<MyButton onClick={mockOnClick}>Click Me</MyButton>);
    fireEvent.click(screen.getByRole('button'));
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });

  test('is disabled when disabled prop is true', () => {
    render(<MyButton disabled>Click Me</MyButton>);
    expect(screen.getByRole('button')).toBeDisabled();
  });
});