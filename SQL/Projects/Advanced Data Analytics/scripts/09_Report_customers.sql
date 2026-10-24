/*
    Purpose:
        Create a customer-level report with demographic attributes, purchase
        metrics, recency, average order value, and average monthly spend.

    Output grain:
        One row per customer dimension key.

    Notes:
        - This script creates or alters gold.report_customers.
        - Age is adjusted based on whether the birthday has occurred this year.
        - A customer with no orders is retained with zero purchase metrics.
        - Lifespan is the number of month boundaries between first and last order.
*/

CREATE OR ALTER VIEW gold.report_customers
AS
WITH Customer_Base AS (
    SELECT
        c.customer_key,
        c.customer_number,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        CASE
            WHEN c.birthdate IS NULL THEN NULL
            ELSE DATEDIFF(YEAR, c.birthdate, CAST(GETDATE() AS DATE))
                 - CASE
                       WHEN DATEADD(
                                YEAR,
                                DATEDIFF(YEAR, c.birthdate, CAST(GETDATE() AS DATE)),
                                c.birthdate
                            ) > CAST(GETDATE() AS DATE)
                       THEN 1 ELSE 0
                   END
        END AS age
    FROM gold.dim_customers AS c
),
Customer_Aggregation AS (
    SELECT
        c.customer_key,
        COUNT(DISTINCT f.order_number) AS total_orders,
        COALESCE(SUM(f.sales_amount), 0) AS total_sales,
        COALESCE(SUM(f.quantity), 0) AS total_quantity,
        COUNT(DISTINCT f.product_key) AS total_products,
        MAX(f.order_date) AS last_order_date,
        MIN(f.order_date) AS first_order_date
    FROM gold.dim_customers AS c
    LEFT JOIN gold.fact_sales AS f
        ON f.customer_key = c.customer_key
    GROUP BY c.customer_key
),
Customer_Metrics AS (
    SELECT
        b.customer_key,
        b.customer_number,
        b.customer_name,
        b.age,
        a.total_orders,
        a.total_sales,
        a.total_quantity,
        a.total_products,
        a.last_order_date,
        DATEDIFF(MONTH, a.first_order_date, a.last_order_date) AS lifespan_months
    FROM Customer_Base AS b
    INNER JOIN Customer_Aggregation AS a
        ON a.customer_key = b.customer_key
)
SELECT
    customer_key,
    customer_number,
    customer_name,
    age,
    CASE
        WHEN age IS NULL THEN 'Unknown'
        WHEN age < 20 THEN 'Under 20'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50 and above'
    END AS age_group,
    CASE
        WHEN last_order_date IS NULL THEN 'New'
        WHEN lifespan_months >= 12 AND total_sales > 5000 THEN 'VIP'
        WHEN lifespan_months >= 12 AND total_sales <= 5000 THEN 'Regular'
        ELSE 'New'
    END AS customer_segment,
    last_order_date,
    CASE
        WHEN last_order_date IS NULL THEN NULL
        ELSE DATEDIFF(MONTH, last_order_date, CAST(GETDATE() AS DATE))
    END AS recency_months,
    total_orders,
    total_sales,
    total_quantity,
    total_products,
    COALESCE(lifespan_months, 0) AS lifespan_months,
    CAST(total_sales / NULLIF(CAST(total_orders AS DECIMAL(18, 4)), 0) AS DECIMAL(18, 2))
        AS average_order_value,
    CAST(
        total_sales / NULLIF(CAST(CASE WHEN lifespan_months = 0 OR lifespan_months IS NULL THEN 1 ELSE lifespan_months END AS DECIMAL(18, 4)), 0)
        AS DECIMAL(18, 2)
    ) AS average_monthly_spend
FROM Customer_Metrics;
