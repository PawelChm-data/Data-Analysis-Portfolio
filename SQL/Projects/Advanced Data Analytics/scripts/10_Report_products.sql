/*
    Purpose:
        Create a product-level report with sales metrics, recency, lifespan,
        product segmentation, and average revenue metrics.

    Output grain:
        One row per product dimension key.

    Notes:
        - This script creates or alters gold.report_products.
        - Products without sales are retained with zero sales/order/customer metrics.
        - Segmentation thresholds are illustrative business rules.
*/

CREATE OR ALTER VIEW gold.report_products
AS
WITH Product_Aggregation AS (
    SELECT
        p.product_key,
        p.product_name,
        p.category,
        p.subcategory,
        p.cost,
        MIN(f.order_date) AS first_sale_date,
        MAX(f.order_date) AS last_sale_date,
        DATEDIFF(MONTH, MIN(f.order_date), MAX(f.order_date)) AS lifespan_months,
        COUNT(DISTINCT f.order_number) AS total_orders,
        COUNT(DISTINCT f.customer_key) AS total_customers,
        COALESCE(SUM(f.sales_amount), 0) AS total_sales,
        COALESCE(SUM(f.quantity), 0) AS total_quantity,
        AVG(CAST(f.sales_amount AS DECIMAL(18, 4)) / NULLIF(f.quantity, 0)) AS average_selling_price
    FROM gold.dim_products AS p
    LEFT JOIN gold.fact_sales AS f
        ON f.product_key = p.product_key
    GROUP BY
        p.product_key,
        p.product_name,
        p.category,
        p.subcategory,
        p.cost
)
SELECT
    product_key,
    product_name,
    category,
    subcategory,
    cost,
    last_sale_date,
    CASE
        WHEN last_sale_date IS NULL THEN NULL
        ELSE DATEDIFF(MONTH, last_sale_date, CAST(GETDATE() AS DATE))
    END AS recency_months,
    CASE
        WHEN total_sales > 50000 THEN 'High Performer'
        WHEN total_sales >= 10000 THEN 'Mid-Range'
        ELSE 'Low Performer'
    END AS product_segment,
    COALESCE(lifespan_months, 0) AS lifespan_months,
    total_orders,
    total_sales,
    total_quantity,
    total_customers,
    CAST(average_selling_price AS DECIMAL(18, 2)) AS average_selling_price,
    CAST(total_sales / NULLIF(CAST(total_orders AS DECIMAL(18, 4)), 0) AS DECIMAL(18, 2))
        AS average_order_revenue,
    CAST(
        total_sales / NULLIF(CAST(CASE WHEN lifespan_months = 0 OR lifespan_months IS NULL THEN 1 ELSE lifespan_months END AS DECIMAL(18, 4)), 0)
        AS DECIMAL(18, 2)
    ) AS average_monthly_revenue
FROM Product_Aggregation;
