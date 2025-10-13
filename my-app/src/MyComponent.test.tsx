import { render, screen, fireEvent } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  it('renders the initial count as 0', () => {
    render(<MyComponent />);
    expect(screen.getByText(/Count: 0/i)).toBeInTheDocument();
  });

  it('increments the count when the button is clicked', () => {
    render(<MyComponent />);
    const button = screen.getByRole('button', { name: /Increment/i });
    fireEvent.click(button);
    expect(screen.getByText(/Count: 1/i)).toBeInTheDocument();
  });
});