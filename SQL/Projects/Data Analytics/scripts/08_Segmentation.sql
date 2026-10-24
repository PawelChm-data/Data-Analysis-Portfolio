/*
    Purpose:
        Segment products into cost bands and count the products in each band.
    Note:
        These bands are example thresholds and can be adapted to the business.
*/

WITH Product_Segments AS (
    SELECT
        product_key,
        CASE
            WHEN cost < 100 THEN 'Below 100'
            WHEN cost < 500 THEN '100-499.99'
            WHEN cost <= 1000 THEN '500-1000'
            ELSE 'Above 1000'
        END AS cost_range
    FROM gold.dim_products
)
SELECT
    cost_range,
    COUNT(product_key) AS total_products
FROM Product_Segments
GROUP BY cost_range
ORDER BY total_products DESC, cost_range;


/*
    Purpose:
        Classify customers as VIP, Regular, or New based on spending and the
        time span between their first and last recorded orders.

    Business rules used in this example:
        - VIP: at least 12 months of order history and total spending > 5,000
        - Regular: at least 12 months of order history and total spending <= 5,000
        - New: less than 12 months between first and last recorded orders

    Important:
        Lifespan is measured between first and last order dates. It is not the
        same as the customer's age or the time since their first order.
        Customers with no orders are included as New by starting from the
        customer dimension and using a LEFT JOIN.
*/

WITH Customer_Spending AS (
    SELECT
        c.customer_key,
        SUM(f.sales_amount) AS total_spending,
        MIN(f.order_date) AS first_order_date,
        MAX(f.order_date) AS last_order_date,
        DATEDIFF(MONTH, MIN(f.order_date), MAX(f.order_date)) AS lifespan_months
    FROM gold.dim_customers AS c
    LEFT JOIN gold.fact_sales AS f
        ON f.customer_key = c.customer_key
    GROUP BY c.customer_key
),
Customer_Segments AS (
    SELECT
        customer_key,
        CASE
            WHEN first_order_date IS NULL THEN 'New'
            WHEN lifespan_months >= 12 AND total_spending > 5000 THEN 'VIP'
            WHEN lifespan_months >= 12 AND total_spending <= 5000 THEN 'Regular'
            ELSE 'New'
        END AS customer_segment
    FROM Customer_Spending
)
SELECT
    customer_segment,
    COUNT(customer_key) AS total_customers
FROM Customer_Segments
GROUP BY customer_segment
ORDER BY total_customers DESC;