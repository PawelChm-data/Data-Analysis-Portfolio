/*
    Purpose:
        Find the five products with the highest total sales revenue.
    Method:
        TOP returns the five highest revenue results after aggregation.
*/

SELECT TOP (5)
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_products AS p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY
    total_revenue DESC,
    p.product_name;


/*
    Purpose:
        Demonstrate ranking with ROW_NUMBER instead of TOP.
    Note:
        ROW_NUMBER assigns a unique sequence; ties are broken by product name.
*/

WITH Product_Revenue AS (
    SELECT
        p.product_name,
        SUM(f.sales_amount) AS total_revenue
    FROM gold.fact_sales AS f
    LEFT JOIN gold.dim_products AS p
        ON p.product_key = f.product_key
    GROUP BY p.product_name
),
Ranked_Products AS (
    SELECT
        product_name,
        total_revenue,
        ROW_NUMBER() OVER (
            ORDER BY total_revenue DESC, product_name
        ) AS revenue_rank
    FROM Product_Revenue
)
SELECT
    product_name,
    total_revenue,
    revenue_rank
FROM Ranked_Products
WHERE revenue_rank <= 5
ORDER BY revenue_rank;


/*
    Purpose:
        Find five products with the lowest total revenue among products present
        in the sales fact table.
    Note:
        This query does not include products with no sales at all.
*/

SELECT TOP (5)
    p.product_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_products AS p
    ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY
    total_revenue ASC,
    p.product_name;


/*
    Purpose:
        Find the ten customers who generated the highest total sales revenue.
*/

SELECT TOP (10)
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_customers AS c
    ON c.customer_key = f.customer_key
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY
    total_revenue DESC,
    c.customer_key;


/*
    Purpose:
        Find three customers with the fewest distinct orders among customers
        represented in the sales fact table.
    Note:
        Customers with zero orders are not present in the fact table and are
        therefore not included by this query.
*/

SELECT TOP (3)
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT f.order_number) AS total_orders
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_customers AS c
    ON c.customer_key = f.customer_key
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY
    total_orders ASC,
    c.customer_key;
