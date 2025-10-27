import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import ButtonComponent from './ButtonComponent';

describe('ButtonComponent', () => {
  test('renders button with children text', () => {
    render(<ButtonComponent>Click me</ButtonComponent>);
    expect(screen.getByText('Click me')).toBeInTheDocument();
  });

  test('calls onClick handler when clicked', () => {
    const handleClick = jest.fn();
    render(<ButtonComponent onClick={handleClick}>Click me</ButtonComponent>);
    
    fireEvent.click(screen.getByText('Click me'));
    expect(handleClick).toHaveBeenCalledTimes(1);
  });

  test('applies primary variant style by default', () => {
    render(<ButtonComponent>Button</ButtonComponent>);
    const button = screen.getByText('Button');
    
    expect(button).toHaveStyle({
      backgroundColor: '#007bff',
      color: 'white',
      border: 'none',
      padding: '10px 20px',
      borderRadius: '4px',
    });
  });

  test('applies secondary variant style when specified', () => {
    render(<ButtonComponent variant="secondary">Button</ButtonComponent>);
    const button = screen.getByText('Button');
    
    expect(button).toHaveStyle({
      backgroundColor: '#6c757d',
      color: 'white',
      border: 'none',
      padding: '10px 20px',
      borderRadius: '4px',
    });
  });
});