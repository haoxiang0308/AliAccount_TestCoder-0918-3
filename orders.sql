-- Mock data for orders table
CREATE TABLE IF NOT EXISTS orders (
    id INT PRIMARY KEY,
    user_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO orders (id, user_id, product_name, amount) VALUES
(101, 1, 'Laptop', 1200.00),
(102, 1, 'Mouse', 25.99),
(103, 2, 'Keyboard', 75.50),
(104, 3, 'Monitor', 299.99);