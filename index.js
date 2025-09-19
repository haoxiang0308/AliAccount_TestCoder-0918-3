const express = require('express');
const { Client } = require('pg');
const app = express();
const port = 3000;

// Создаем клиент базы данных
const client = new Client({
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'myuser',
  password: process.env.DB_PASSWORD || 'mypassword',
  database: process.env.DB_NAME || 'mydatabase',
  port: 5432,
});

// Подключаемся к базе данных
client.connect()
  .then(() => console.log('Connected to PostgreSQL'))
  .catch(err => console.error('Connection error', err.stack));

// Простой маршрут
app.get('/', (req, res) => {
  res.send('Hello World! Node.js app with PostgreSQL');
});

// Маршрут для проверки подключения к базе данных
app.get('/db-test', async (req, res) => {
  try {
    const result = await client.query('SELECT NOW()');
    res.json({ 
      message: 'Database connection successful', 
      timestamp: result.rows[0].now 
    });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.listen(port, () => {
  console.log(`App running on http://localhost:${port}`);
});