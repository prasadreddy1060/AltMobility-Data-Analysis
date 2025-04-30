
-- 1.1 Total Orders & Revenue
SELECT 
    COUNT(*) AS total_orders,
    SUM(order_amount) AS total_revenue
FROM customer_orders;

-- 1.2 Orders by Status
SELECT 
    order_status,
    COUNT(*) AS num_orders,
    SUM(order_amount) AS revenue_generated
FROM customer_orders
GROUP BY order_status
ORDER BY num_orders DESC;

-- 1.3 Monthly Revenue Trend
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    COUNT(*) AS total_orders,
    SUM(order_amount) AS total_revenue
FROM customer_orders
GROUP BY month
ORDER BY month;

-- 1.4 Average Order Value by Status
SELECT 
    order_status,
    ROUND(AVG(order_amount), 2) AS avg_order_value
FROM customer_orders
GROUP BY order_status;
