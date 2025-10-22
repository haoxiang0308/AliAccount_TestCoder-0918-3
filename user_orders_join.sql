-- SQL query to join users and orders tables
SELECT 
    u.user_id,
    u.username,
    u.email,
    o.order_id,
    o.order_date,
    o.total_amount
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
ORDER BY o.order_date DESC;