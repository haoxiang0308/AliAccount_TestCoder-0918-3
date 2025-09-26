const { v4: uuidv4 } = require('uuid');

const data = {
  users: [
    { id: uuidv4(), name: "Alice Johnson", email: "alice.johnson@example.com", active: true },
    { id: uuidv4(), name: "Bob Smith", email: "bob.smith@example.com", active: false },
    { id: uuidv4(), name: "Charlie Brown", email: "charlie.brown@example.com", active: true }
  ],
  timestamp: new Date().toISOString()
};

const filename = `/workspace/api_response_${uuidv4()}.json`;

require('fs').writeFileSync(filename, JSON.stringify(data, null, 2));
console.log(`Data written to ${filename}`);