import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import Counter from './Counter';

describe('Counter Component', () => {
  test('renders with initial count', () => {
    render(<Counter initialCount={5} />);
    expect(screen.getByText('Counter: 5')).toBeInTheDocument();
  });

  test('increments count when + button is clicked', () => {
    render(<Counter />);
    const incrementButton = screen.getByText('+');
    fireEvent.click(incrementButton);
    expect(screen.getByText('Counter: 1')).toBeInTheDocument();
  });

  test('decrements count when - button is clicked', () => {
    render(<Counter />);
    const decrementButton = screen.getByText('-');
    fireEvent.click(decrementButton);
    expect(screen.getByText('Counter: -1')).toBeInTheDocument();
  });

  test('resets count when Reset button is clicked', () => {
    render(<Counter initialCount={3} />);
    const incrementButton = screen.getByText('+');
    const resetButton = screen.getByText('Reset');
    
    // Increment first
    fireEvent.click(incrementButton);
    fireEvent.click(incrementButton);
    expect(screen.getByText('Counter: 5')).toBeInTheDocument();
    
    // Then reset
    fireEvent.click(resetButton);
    expect(screen.getByText('Counter: 3')).toBeInTheDocument();
  });
});