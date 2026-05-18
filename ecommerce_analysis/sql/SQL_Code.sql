use ecommerce_db;
SELECT *
FROM orders;

SELECT *
FROM orders
LIMIT 5;

SELECT year, month, SUM(TotalAmount) AS total_revenue
FROM orders
GROUP BY year, month
ORDER BY year, month;

SELECT category, SUM(TotalAmount) AS total_revenue
FROM orders
Group BY category
ORDER BY total_revenue DESC;

SELECT platform, COUNT(*) AS total_orders, SUM(TotalAmount) AS total_revenue
FROM orders
GROUP BY platform
ORDER BY total_revenue DESC;

SELECT product, SUM(TotalAmount) AS total_revenue
FROM orders
GROUP BY product
ORDER BY total_revenue DESC
LIMIT 10;

SELECT platform, AVG(TotalAmount) as avg_order_value
FROM orders
GROUP BY platform
ORDER BY avg_order_value DESC;

SELECT rating, COUNT(*) AS total_orders, AVG(TotalAmount) AS total_revenue
FROM orders
GROUP BY rating
ORDER BY rating;

SELECT * FROM orders;

SELECT CATEGORY, BRAND, DATE(OrderDate) AS Order_date_only
from orders;orders 