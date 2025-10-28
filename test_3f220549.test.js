import React from 'react';
import { render, screen } from '@testing-library/react';
import UserProfile from './UserProfile';

describe('UserProfile Component', () => {
  const mockUser = {
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
    phone: '+1-234-567-8900',
    address: '123 Main St, City, State',
    bio: 'Software developer with 5 years of experience.',
    avatar: 'https://example.com/avatar.jpg'
  };

  it('renders user profile information correctly', () => {
    render(<UserProfile user={mockUser} />);

    // Check if user's name is displayed
    expect(screen.getByText(/John Doe/i)).toBeInTheDocument();
    
    // Check if email is displayed
    expect(screen.getByText(/john\.doe@example\.com/i)).toBeInTheDocument();
    
    // Check if phone is displayed
    expect(screen.getByText(/\+1-234-567-8900/i)).toBeInTheDocument();
    
    // Check if address is displayed
    expect(screen.getByText(/123 Main St, City, State/i)).toBeInTheDocument();
    
    // Check if bio is displayed
    expect(screen.getByText(/Software developer with 5 years of experience\./i)).toBeInTheDocument();
    
    // Check if avatar is displayed
    const avatar = screen.getByAltText(/Avatar of John Doe/i);
    expect(avatar).toBeInTheDocument();
    expect(avatar).toHaveAttribute('src', 'https://example.com/avatar.jpg');
  });

  it('renders without optional fields when not provided', () => {
    const userWithoutOptionalFields = {
      firstName: 'Jane',
      lastName: 'Smith',
      email: 'jane.smith@example.com'
    };

    render(<UserProfile user={userWithoutOptionalFields} />);

    // Check if required fields are still displayed
    expect(screen.getByText(/Jane Smith/i)).toBeInTheDocument();
    expect(screen.getByText(/jane\.smith@example\.com/i)).toBeInTheDocument();
    
    // Check that optional fields are not rendered
    expect(screen.queryByText(/\+1-234-567-8900/i)).not.toBeInTheDocument();
    expect(screen.queryByText(/123 Main St/i)).not.toBeInTheDocument();
    expect(screen.queryByText(/Software developer/i)).not.toBeInTheDocument();
  });

  it('renders avatar when provided', () => {
    render(<UserProfile user={mockUser} />);
    
    const avatar = screen.getByAltText(/Avatar of John Doe/i);
    expect(avatar).toBeInTheDocument();
  });

  it('does not render avatar when not provided', () => {
    const userWithoutAvatar = {
      ...mockUser,
      avatar: undefined
    };
    
    render(<UserProfile user={userWithoutAvatar} />);
    
    const avatar = screen.queryByAltText(/Avatar of John Doe/i);
    expect(avatar).not.toBeInTheDocument();
  });
});