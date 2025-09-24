-- SQL query to join users and orders tables
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    users.email,
    orders.id AS order_id,
    orders.order_date,
    orders.total_amount
FROM 
    users
INNER JOIN 
    orders
ON 
    users.id = orders.user_id;