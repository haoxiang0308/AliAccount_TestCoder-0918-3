const { v4: uuidv4 } = require('uuid');

const data = {
  users: [
    { id: uuidv4(), name: "Alice", email: "alice@example.com" },
    { id: uuidv4(), name: "Bob", email: "bob@example.com" },
    { id: uuidv4(), name: "Charlie", email: "charlie@example.com" }
  ],
  timestamp: new Date().toISOString()
};

const filename = `/workspace/data_${uuidv4()}.json`;

require('fs').writeFileSync(filename, JSON.stringify(data, null, 2));

console.log(`Data saved to ${filename}`);