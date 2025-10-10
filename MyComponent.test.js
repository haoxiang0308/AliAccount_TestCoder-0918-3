import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

test('renders hello message with name', () => {
  const testName = 'John';
  render(<MyComponent name={testName} />);
  const element = screen.getByText(`Hello, ${testName}!`);
  expect(element).toBeInTheDocument();
});