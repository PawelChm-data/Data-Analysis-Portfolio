/*
    Purpose:
        Count customers by country and gender.
*/

-- Customers by country.
SELECT
    country,
    COUNT(*) AS total_customers
FROM gold.dim_customers
GROUP BY country
ORDER BY total_customers DESC, country;

-- Customers by gender.
SELECT
    gender,
    COUNT(DISTINCT customer_id) AS total_customers
FROM gold.dim_customers
GROUP BY gender
ORDER BY total_customers DESC, gender;


/*
    Purpose:
        Count products by category and compare average product cost across categories.
*/

-- Products by category.
SELECT
    category,
    COUNT(product_key) AS total_products
FROM gold.dim_products
GROUP BY category
ORDER BY total_products DESC, category;

-- Average cost by category.
SELECT
    category,
    AVG(CAST(cost AS DECIMAL(18, 2))) AS average_cost
FROM gold.dim_products
GROUP BY category
ORDER BY average_cost DESC, category;


/*
    Purpose:
        Calculate total sales revenue for each product category.
    Note:
        LEFT JOIN retains fact rows even when a product dimension key is unmatched.
*/

SELECT
    p.category,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_products AS p
    ON p.product_key = f.product_key
GROUP BY p.category
ORDER BY total_revenue DESC;


/*
    Purpose:
        Rank customers by their total sales revenue.
*/

SELECT
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
ORDER BY total_revenue DESC;


/*
    Purpose:
        Show the total quantity sold to customers in each country.
    Note:
        Rows with no matching customer dimension record appear under a NULL country.
*/

SELECT
    c.country,
    SUM(f.quantity) AS total_quantity_sold
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_customers AS c
    ON c.customer_key = f.customer_key
GROUP BY c.country
ORDER BY total_quantity_sold DESC;