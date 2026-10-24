/*
    Purpose:
        Compare each product's annual sales with its average annual sales and
        the previous available year.
    Metrics:
        - Difference from the product's average annual sales
        - Difference from the previous available year
    Note:
        LAG compares with the previous available year for that product. If a year
        has no sales for a product, the previous row may not be the prior calendar year.
*/

WITH Yearly_Product_Sales AS (
    SELECT
        YEAR(f.order_date) AS order_year,
        p.product_key,
        p.product_name,
        SUM(f.sales_amount) AS current_sales
    FROM gold.fact_sales AS f
    LEFT JOIN gold.dim_products AS p
        ON p.product_key = f.product_key
    WHERE f.order_date IS NOT NULL
    GROUP BY
        YEAR(f.order_date),
        p.product_key,
        p.product_name
),
Product_Comparisons AS (
    SELECT
        order_year,
        product_key,
        product_name,
        current_sales,
        AVG(current_sales) OVER (
            PARTITION BY product_key
        ) AS average_annual_sales,
        LAG(current_sales) OVER (
            PARTITION BY product_key
            ORDER BY order_year
        ) AS previous_available_year_sales
    FROM Yearly_Product_Sales
)
SELECT
    order_year,
    product_key,
    product_name,
    current_sales,
    average_annual_sales,
    current_sales - average_annual_sales AS difference_from_average,
    CASE
        WHEN current_sales > average_annual_sales THEN 'Above Average'
        WHEN current_sales < average_annual_sales THEN 'Below Average'
        ELSE 'Average'
    END AS average_sales_status,
    previous_available_year_sales,
    current_sales - previous_available_year_sales AS difference_from_previous_year,
    CASE
        WHEN previous_available_year_sales IS NULL THEN 'No Previous Period'
        WHEN current_sales > previous_available_year_sales THEN 'Increase'
        WHEN current_sales < previous_available_year_sales THEN 'Decrease'
        ELSE 'No Change'
    END AS year_over_year_status
FROM Product_Comparisons
ORDER BY product_name, order_year;


/*
    Purpose:
        Compare each product's monthly sales with its average monthly sales and
        the previous available month.
    Note:
        The query groups by year and month together via order_month. This avoids
        mixing January from different years.
*/

WITH Monthly_Product_Sales AS (
    SELECT
        DATETRUNC(MONTH, f.order_date) AS order_month,
        p.product_key,
        p.product_name,
        SUM(f.sales_amount) AS current_sales
    FROM gold.fact_sales AS f
    LEFT JOIN gold.dim_products AS p
        ON p.product_key = f.product_key
    WHERE f.order_date IS NOT NULL
    GROUP BY
        DATETRUNC(MONTH, f.order_date),
        p.product_key,
        p.product_name
),
Product_Comparisons AS (
    SELECT
        order_month,
        product_key,
        product_name,
        current_sales,
        AVG(current_sales) OVER (
            PARTITION BY product_key
        ) AS average_monthly_sales,
        LAG(current_sales) OVER (
            PARTITION BY product_key
            ORDER BY order_month
        ) AS previous_available_month_sales
    FROM Monthly_Product_Sales
)
SELECT
    order_month,
    product_key,
    product_name,
    current_sales,
    average_monthly_sales,
    current_sales - average_monthly_sales AS difference_from_average,
    CASE
        WHEN current_sales > average_monthly_sales THEN 'Above Average'
        WHEN current_sales < average_monthly_sales THEN 'Below Average'
        ELSE 'Average'
    END AS average_sales_status,
    previous_available_month_sales,
    current_sales - previous_available_month_sales AS difference_from_previous_month,
    CASE
        WHEN previous_available_month_sales IS NULL THEN 'No Previous Period'
        WHEN current_sales > previous_available_month_sales THEN 'Increase'
        WHEN current_sales < previous_available_month_sales THEN 'Decrease'
        ELSE 'No Change'
    END AS month_over_month_status
FROM Product_Comparisons
ORDER BY product_name, order_month;