/*
    Purpose:
        Summarize sales by month using a real month-start date.
    Metrics:
        - Total sales
        - Distinct customers
        - Total quantity
    Note:
        DATETRUNC requires SQL Server 2022 or later. If using an older version,
        replace DATETRUNC(MONTH, order_date) with DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1).
*/

SELECT
    DATETRUNC(MONTH, order_date) AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(MONTH, order_date)
ORDER BY order_month;


/*
    Purpose:
        Calculate monthly sales, running total sales, and a cumulative average
        of monthly average prices.
    Note:
        The moving average below is cumulative from the first available month,
        not a fixed-width rolling window.
*/

WITH Monthly_Sales AS (
    SELECT
        DATETRUNC(MONTH, order_date) AS order_month,
        SUM(sales_amount) AS total_sales,
        AVG(CAST(price AS DECIMAL(18, 4))) AS average_price
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(MONTH, order_date)
)
SELECT
    order_month,
    total_sales,
    SUM(total_sales) OVER (
        ORDER BY order_month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total_sales,
    AVG(average_price) OVER (
        ORDER BY order_month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_average_monthly_price
FROM Monthly_Sales
ORDER BY order_month;
