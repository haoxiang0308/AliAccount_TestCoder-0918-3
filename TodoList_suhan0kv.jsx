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
      <h1>Список дел</h1>
      <div style={{ display: 'flex', marginBottom: '20px' }}>
        <input
          type="text"
          value={inputValue}
          onChange={(e) => setInputValue(e.target.value)}
          onKeyPress={handleKeyPress}
          placeholder="Добавить новую задачу..."
          style={{ 
            padding: '10px', 
            fontSize: '16px', 
            flex: 1, 
            border: '1px solid #ccc', 
            borderRadius: '4px 0 0 4px' 
          }}
        />
        <button 
          onClick={addTodo}
          style={{ 
            padding: '10px 20px', 
            fontSize: '16px', 
            backgroundColor: '#4CAF50', 
            color: 'white', 
            border: 'none', 
            borderRadius: '0 4px 4px 0',
            cursor: 'pointer'
          }}
        >
          Добавить
        </button>
      </div>
      
      <ul style={{ listStyleType: 'none', padding: 0 }}>
        {todos.map(todo => (
          <li 
            key={todo.id} 
            style={{ 
              display: 'flex', 
              alignItems: 'center', 
              padding: '10px', 
              borderBottom: '1px solid #eee',
              backgroundColor: '#f9f9f9',
              marginBottom: '5px',
              borderRadius: '4px'
            }}
          >
            <input
              type="checkbox"
              checked={todo.completed}
              onChange={() => toggleTodo(todo.id)}
              style={{ marginRight: '10px' }}
            />
            <span 
              style={{ 
                flex: 1, 
                textDecoration: todo.completed ? 'line-through' : 'none',
                color: todo.completed ? '#888' : '#000'
              }}
            >
              {todo.text}
            </span>
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
              Удалить
            </button>
          </li>
        ))}
      </ul>
      
      {todos.length === 0 && (
        <p style={{ textAlign: 'center', color: '#888' }}>Список задач пуст</p>
      )}
    </div>
  );
};

export default TodoList;