-- SQL query to join users and orders tables
SELECT 
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    o.id AS order_id,
    o.order_date,
    o.total_amount
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
ORDER BY u.id, o.order_date;