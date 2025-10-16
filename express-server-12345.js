const express = require('express');
const app = express();
const PORT = 3000;

// Simple route
app.get('/', (req, res) => {
  res.send('Hello, World! Express server is running on port 3000.');
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});