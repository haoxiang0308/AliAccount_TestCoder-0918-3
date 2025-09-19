import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import TodoList from './RandomTodoComponent';

describe('TodoList Component', () => {
  test('renders without crashing', () => {
    render(<TodoList />);
    expect(screen.getByText('My Todo List')).toBeInTheDocument();
  });

  test('adds a new todo item', () => {
    render(<TodoList />);
    
    const input = screen.getByPlaceholderText('Add a new task...');
    const addButton = screen.getByText('Add');
    
    fireEvent.change(input, { target: { value: 'New task' } });
    fireEvent.click(addButton);
    
    expect(screen.getByText('New task')).toBeInTheDocument();
    expect(input.value).toBe('');
  });

  test('removes a todo item', () => {
    render(<TodoList />);
    
    const input = screen.getByPlaceholderText('Add a new task...');
    const addButton = screen.getByText('Add');
    
    // Add a task first
    fireEvent.change(input, { target: { value: 'Task to remove' } });
    fireEvent.click(addButton);
    
    // Verify task is added
    expect(screen.getByText('Task to remove')).toBeInTheDocument();
    
    // Remove the task
    const removeButton = screen.getByText('Remove');
    fireEvent.click(removeButton);
    
    // Verify task is removed
    expect(screen.queryByText('Task to remove')).not.toBeInTheDocument();
  });

  test('shows message when no tasks', () => {
    render(<TodoList />);
    expect(screen.getByText('No tasks yet. Add some!')).toBeInTheDocument();
  });

  test('does not add empty todos', () => {
    render(<TodoList />);
    
    const addButton = screen.getByText('Add');
    const initialTodosCount = screen.queryAllByText('Remove').length;
    
    fireEvent.click(addButton);
    
    // Count should remain the same
    expect(screen.queryAllByText('Remove').length).toBe(initialTodosCount);
  });
});