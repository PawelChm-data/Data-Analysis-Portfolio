/*
    Purpose:
        Inspect database metadata before beginning analysis.

    Contents:
        1. List tables and views visible through INFORMATION_SCHEMA.
        2. Inspect column definitions for a selected table.

    Notes:
        INFORMATION_SCHEMA provides standard metadata, but does not expose every
        SQL Server-specific object detail.
*/

-- 1. List tables and views in the current database.
SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
ORDER BY
    TABLE_SCHEMA,
    TABLE_NAME;

-- 2. Inspect columns for the Gold customer dimension.
SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'gold'
  AND TABLE_NAME = 'dim_customers'
ORDER BY ORDINAL_POSITION;


/*
    Purpose:
        Explore the main attributes available in the customer and product dimensions.
*/

-- Countries represented in the customer dimension.
SELECT DISTINCT
    country
FROM gold.dim_customers
ORDER BY country;

-- Product category hierarchy and product names.
SELECT DISTINCT
    category,
    subcategory,
    product_name
FROM gold.dim_products
ORDER BY
    category,
    subcategory,
    product_name;



/*
    Purpose:
        Understand the time coverage of the sales data and the age range of customers.

    Notes:
        DATEDIFF counts year/month boundaries. The range columns are therefore
        calendar-boundary counts, not exact elapsed durations.
*/

-- First and last recorded order date and calendar-boundary range.
SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    DATEDIFF(YEAR, MIN(order_date), MAX(order_date)) AS year_boundaries,
    DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS month_boundaries
FROM gold.fact_sales;

-- Oldest and youngest customers based on their birth dates.
-- Age is adjusted when the birthday has not occurred yet in the current year.
SELECT
    MIN(birthdate) AS oldest_birthdate,
    MAX(birthdate) AS youngest_birthdate,
    MAX(
        CASE
            WHEN birthdate IS NULL THEN NULL
            ELSE DATEDIFF(YEAR, birthdate, CAST(GETDATE() AS DATE))
                 - CASE
                       WHEN DATEADD(
                                YEAR,
                                DATEDIFF(YEAR, birthdate, CAST(GETDATE() AS DATE)),
                                birthdate
                            ) > CAST(GETDATE() AS DATE)
                       THEN 1 ELSE 0
                   END
        END
    ) AS oldest_age,
    MIN(
        CASE
            WHEN birthdate IS NULL THEN NULL
            ELSE DATEDIFF(YEAR, birthdate, CAST(GETDATE() AS DATE))
                 - CASE
                       WHEN DATEADD(
                                YEAR,
                                DATEDIFF(YEAR, birthdate, CAST(GETDATE() AS DATE)),
                                birthdate
                            ) > CAST(GETDATE() AS DATE)
                       THEN 1 ELSE 0
                   END
        END
    ) AS youngest_age
FROM gold.dim_customers;
