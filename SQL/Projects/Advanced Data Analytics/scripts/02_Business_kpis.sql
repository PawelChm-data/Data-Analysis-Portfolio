/*
    Purpose:
        Return core business KPIs in a single two-column result set.

    Notes:
        UNION ALL preserves all KPI rows. Values are cast to DECIMAL so the
        Measure_Value column has a consistent numeric type.
        Average Price is the arithmetic average of the price values in fact rows.
*/

SELECT
    'Total Sales' AS measure_name,
    CAST(SUM(sales_amount) AS DECIMAL(18, 2)) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT
    'Total Quantity',
    CAST(SUM(quantity) AS DECIMAL(18, 2))
FROM gold.fact_sales

UNION ALL

SELECT
    'Average Price',
    CAST(AVG(CAST(price AS DECIMAL(18, 4))) AS DECIMAL(18, 2))
FROM gold.fact_sales

UNION ALL

SELECT
    'Total Orders',
    CAST(COUNT(DISTINCT order_number) AS DECIMAL(18, 2))
FROM gold.fact_sales

UNION ALL

SELECT
    'Total Products',
    CAST(COUNT(*) AS DECIMAL(18, 2))
FROM gold.dim_products

UNION ALL

SELECT
    'Total Customers',
    CAST(COUNT(*) AS DECIMAL(18, 2))
FROM gold.dim_customers

UNION ALL

SELECT
    'Customers With Orders',
    CAST(COUNT(DISTINCT customer_key) AS DECIMAL(18, 2))
FROM gold.fact_sales
WHERE order_number IS NOT NULL
  AND customer_key IS NOT NULL;
