-- SQL查询：连接用户表和订单表
-- 假设表结构如下：
-- users表包含字段：user_id, username, email
-- orders表包含字段：order_id, user_id, order_date, total_amount

SELECT 
    u.user_id,
    u.username,
    u.email,
    o.order_id,
    o.order_date,
    o.total_amount
FROM 
    users u
INNER JOIN 
    orders o ON u.user_id = o.user_id
ORDER BY 
    u.username, o.order_date;