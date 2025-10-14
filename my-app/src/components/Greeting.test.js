import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import Greeting from './Greeting';

describe('Greeting Component', () => {
  test('renders the component with the correct name', () => {
    const testName = 'Alice';
    render(<Greeting name={testName} />);

    expect(screen.getByText(`Hello, ${testName}!`)).toBeInTheDocument();
  });

  test('renders different names correctly', () => {
    const anotherName = 'Bob';
    render(<Greeting name={anotherName} />);

    expect(screen.getByText(`Hello, ${anotherName}!`)).toBeInTheDocument();
  });
});