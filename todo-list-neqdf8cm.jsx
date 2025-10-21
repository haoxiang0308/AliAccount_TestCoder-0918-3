import React, { useState } from 'react';

const TodoList = () => {
  const [todos, setTodos] = useState([]);
  const [inputValue, setInputValue] = useState('');

  const addTodo = () => {
    if (inputValue.trim() !== '') {
      setTodos([...todos, { id: Date.now(), text: inputValue, completed: false }]);
      setInputValue('');
    }
  };

  const toggleTodo = (id) => {
    setTodos(todos.map(todo =>
      todo.id === id ? { ...todo, completed: !todo.completed } : todo
    ));
  };

  const deleteTodo = (id) => {
    setTodos(todos.filter(todo => todo.id !== id));
  };

  const handleKeyPress = (e) => {
    if (e.key === 'Enter') {
      addTodo();
    }
  };

  return (
    <div style={{ padding: '20px', maxWidth: '500px', margin: '0 auto' }}>
      <h1>My Todo List</h1>
      
      <div style={{ marginBottom: '20px' }}>
        <input
          type="text"
          value={inputValue}
          onChange={(e) => setInputValue(e.target.value)}
          onKeyPress={handleKeyPress}
          placeholder="Add a new task..."
          style={{
            padding: '10px',
            fontSize: '16px',
            width: '70%',
            marginRight: '10px',
            borderRadius: '4px',
            border: '1px solid #ccc'
          }}
        />
        <button
          onClick={addTodo}
          style={{
            padding: '10px 15px',
            fontSize: '16px',
            backgroundColor: '#4CAF50',
            color: 'white',
            border: 'none',
            borderRadius: '4px',
            cursor: 'pointer'
          }}
        >
          Add
        </button>
      </div>

      <ul style={{ listStyleType: 'none', padding: 0 }}>
        {todos.map(todo => (
          <li
            key={todo.id}
            style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center',
              padding: '10px',
              margin: '5px 0',
              backgroundColor: '#f9f9f9',
              borderRadius: '4px',
              border: '1px solid #eee',
              textDecoration: todo.completed ? 'line-through' : 'none',
              color: todo.completed ? '#888' : '#333'
            }}
          >
            <div style={{ display: 'flex', alignItems: 'center' }}>
              <input
                type="checkbox"
                checked={todo.completed}
                onChange={() => toggleTodo(todo.id)}
                style={{ marginRight: '10px' }}
              />
              <span>{todo.text}</span>
            </div>
            <button
              onClick={() => deleteTodo(todo.id)}
              style={{
                padding: '5px 10px',
                backgroundColor: '#f44336',
                color: 'white',
                border: 'none',
                borderRadius: '4px',
                cursor: 'pointer'
              }}
            >
              Delete
            </button>
          </li>
        ))}
      </ul>

      {todos.length === 0 && (
        <p style={{ textAlign: 'center', color: '#888', fontStyle: 'italic' }}>
          No tasks yet. Add a new task above!
        </p>
      )}
    </div>
  );
};

export default TodoList;