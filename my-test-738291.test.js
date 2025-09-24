import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders with default name', () => {
    render(<MyComponent />);
    expect(screen.getByText('Hello, World!')).toBeInTheDocument();
  });

  test('renders with custom name', () => {
    render(<MyComponent name="Alice" />);
    expect(screen.getByText('Hello, Alice!')).toBeInTheDocument();
  });
});