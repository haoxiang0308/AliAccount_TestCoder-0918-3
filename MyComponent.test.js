// This is a placeholder test file generated because the full setup timed out.
// A real test would require a complete Node.js project setup and dependency installation.

import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders with the correct name', () => {
    render(<MyComponent name="Alice" />);
    const element = screen.getByText(/Hello, Alice!/i);
    expect(element).toBeInTheDocument();
  });
});