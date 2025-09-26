-- SQL Query to join users and orders tables
SELECT
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    o.id AS order_id,
    o.product_name,
    o.amount
FROM
    users u
JOIN
    orders o ON u.id = o.user_id
ORDER BY
    u.name, o.id;