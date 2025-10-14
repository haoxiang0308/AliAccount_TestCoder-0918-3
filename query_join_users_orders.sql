-- SQL query to join users and orders tables
SELECT u.id, u.name, u.email, o.id AS order_id, o.order_date, o.total
FROM users u
JOIN orders o ON u.id = o.user_id;