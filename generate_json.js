const { v4: uuidv4 } = require('uuid');

const data = {
  id: uuidv4(),
  name: "Sample Product",
  price: 29.99,
  in_stock: true,
  tags: ["electronics", "sale"],
  metadata: {
    created_at: new Date().toISOString()
  }
};

const filename = `/workspace/data_${data.id}.json`;
require('fs').writeFileSync(filename, JSON.stringify(data, null, 2));
console.log(`Data saved to ${filename}`);