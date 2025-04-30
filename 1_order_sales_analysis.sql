
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



--2.1 Repeat vs. One-Time Customers
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(*) FILTER (WHERE order_count > 1) AS repeat_customers,
    COUNT(*) FILTER (WHERE order_count = 1) AS one_time_customers
FROM (
    SELECT 
        customer_id,
        COUNT(*) AS order_count
    FROM customer_orders
    GROUP BY customer_id
) AS customer_orders_summary;

--2.2 Customer Segmentation by Order Count
SELECT 
    order_count,
    COUNT(*) AS num_customers
FROM (
    SELECT 
        customer_id,
        COUNT(*) AS order_count
    FROM customer_orders
    GROUP BY customer_id
) AS subquery
GROUP BY order_count
ORDER BY order_count;

--2.3 Monthly Active Customers
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    COUNT(DISTINCT customer_id) AS active_customers
FROM customer_orders
GROUP BY month
ORDER BY month;


--3.1 Payment Success Rate
SELECT 
    payment_status,
    COUNT(*) AS num_payments,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM payments
GROUP BY payment_status;

--3.2 Monthly Payment Success vs. Failure
SELECT 
    DATE_TRUNC('month', payment_date) AS month,
    payment_status,
    COUNT(*) AS num_payments
FROM payments
GROUP BY month, payment_status
ORDER BY month, payment_status;

--3.3 Failed Payments by Payment Method
SELECT 
    payment_method,
    COUNT(*) AS failed_payments
FROM payments
WHERE payment_status = 'failed'
GROUP BY payment_method
ORDER BY failed_payments DESC;

--4.1 Comprehensive Order & Payment Overview
SELECT 
    co.order_id,
    co.customer_id,
    co.order_date,
    co.order_status,
    co.order_amount,
    p.payment_id,
    p.payment_method,
    p.payment_date,
    p.payment_status
FROM customer_orders AS co
LEFT JOIN payments AS p
    ON co.order_id = p.order_id
ORDER BY co.order_date;

--4.2 Orders with Payment Failures
SELECT 
    co.order_id,
    co.customer_id,
    co.order_amount,
    p.payment_status,
    p.payment_method
FROM customer_orders AS co
JOIN payments AS p ON co.order_id = p.order_id
WHERE p.payment_status = 'failed';

--4.3 Revenue from Successful Payments
SELECT 
    SUM(co.order_amount) AS successful_payment_revenue
FROM customer_orders AS co
JOIN payments AS p ON co.order_id = p.order_id
WHERE p.payment_status = 'successful';


