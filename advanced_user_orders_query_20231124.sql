-- 复杂SQL查询：连接用户表和订单表并进行统计
-- 包含用户信息、订单信息以及订单统计

-- 查询每个用户的订单数量和总金额
SELECT 
    u.user_id,
    u.username,
    u.email,
    COUNT(o.order_id) AS order_count,
    COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM 
    users u
LEFT JOIN 
    orders o ON u.user_id = o.user_id
GROUP BY 
    u.user_id, u.username, u.email
ORDER BY 
    total_spent DESC;

-- 查询详细订单信息
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