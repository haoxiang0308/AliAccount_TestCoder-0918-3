import { useState } from 'react';

const TodoList = () => {
  const [todos, setTodos] = useState([
    { id: 1, text: 'Изучить React', completed: false },
    { id: 2, text: 'Создать компонент списка дел', completed: true },
    { id: 3, text: 'Настроить проект', completed: false },
  ]);
  const [inputValue, setInputValue] = useState('');

  const addTodo = () => {
    if (inputValue.trim() !== '') {
      setTodos([...todos, { id: Date.now(), text: inputValue, completed: false }]);
      setInputValue('');
    }
  };

  const toggleTodo = (id) => {
    setTodos(
      todos.map((todo) =>
        todo.id === id ? { ...todo, completed: !todo.completed } : todo
      )
    );
  };

  const deleteTodo = (id) => {
    setTodos(todos.filter((todo) => todo.id !== id));
  };

  return (
    <div>
      <h2>Список дел</h2>
      <div style={{ marginBottom: '1rem' }}>
        <input
          type="text"
          value={inputValue}
          onChange={(e) => setInputValue(e.target.value)}
          placeholder="Добавить задачу..."
          style={{ marginRight: '0.5rem', padding: '0.5rem' }}
        />
        <button onClick={addTodo} style={{ padding: '0.5rem' }}>Добавить</button>
      </div>
      <ul style={{ listStyleType: 'none', padding: 0 }}>
        {todos.map((todo) => (
          <li key={todo.id} style={{ marginBottom: '0.5rem', display: 'flex', alignItems: 'center' }}>
            <input
              type="checkbox"
              checked={todo.completed}
              onChange={() => toggleTodo(todo.id)}
              style={{ marginRight: '0.5rem' }}
            />
            <span style={{ textDecoration: todo.completed ? 'line-through' : 'none', marginRight: '0.5rem' }}>
              {todo.text}
            </span>
            <button onClick={() => deleteTodo(todo.id)} style={{ padding: '0.25rem 0.5rem' }}>Удалить</button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default TodoList;