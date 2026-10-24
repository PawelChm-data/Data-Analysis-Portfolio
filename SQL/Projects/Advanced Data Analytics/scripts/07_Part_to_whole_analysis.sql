/*
    Purpose:
        Calculate each product category's contribution to overall sales.
    Note:
        A NULL category can appear if a fact row has no matching product dimension row.
*/

WITH Category_Sales AS (
    SELECT
        p.category,
        SUM(f.sales_amount) AS total_sales
    FROM gold.fact_sales AS f
    LEFT JOIN gold.dim_products AS p
        ON p.product_key = f.product_key
    GROUP BY p.category
)
SELECT
    category,
    total_sales,
    SUM(total_sales) OVER () AS overall_sales,
    CAST(
        100.0 * total_sales / NULLIF(SUM(total_sales) OVER (), 0)
        AS DECIMAL(9, 2)
    ) AS percentage_of_total
FROM Category_Sales
ORDER BY total_sales DESC;
