import React from 'react';
import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders the name prop', () => {
    render(<MyComponent name="Alice" />);
    expect(screen.getByText(/Hello, Alice!/i)).toBeInTheDocument();
  });

  test('renders a list of items', () => {
    const items = ['Apple', 'Banana', 'Cherry'];
    render(<MyComponent name="Bob" items={items} />);
    items.forEach(item => {
      expect(screen.getByText(item)).toBeInTheDocument();
    });
  });

  test('renders an empty list if no items are provided', () => {
    render(<MyComponent name="Charlie" />);
    // Check that no <li> elements are rendered
    expect(screen.queryByRole('listitem')).not.toBeInTheDocument();
  });
});