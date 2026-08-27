/*
SQL Lesson 7 - OUTER JOINs Practice

Topics covered:
- LEFT JOIN
- LEFT JOIN vs INNER JOIN
- ON vs WHERE
- NULL values after LEFT JOIN
- IS NULL
- Filtering the right-side table while preserving unmatched rows
- Comparing data between tables
- Multi-condition JOINs

Tables used:
- customers
- transactions

Common key:
- customer_id

Dataset:
Synthetic transaction data created for educational purposes.
*/


-- ============================================================
-- SECTION 1: BASIC LEFT JOIN
-- ============================================================

-- Task 1
-- Display all customers and their transactions.
--
-- Show:
-- customer_id
-- customer_name
-- transaction_id
-- amount
--
-- Customers without transactions must also be included.

SELECT customers.customer_id,
       customers.customer_name,
       transactions.transaction_id,
       transactions.amount
FROM customers
LEFT JOIN transactions
    ON customers.customer_id = transactions.customer_id;


-- Task 2
-- Display all customers and their transactions.
--
-- Show:
-- customer_id
-- customer_name
-- transaction_id
-- amount
--
-- Sort first by customer name alphabetically
-- and then by transaction amount from highest to lowest.

SELECT customers.customer_id,
       customers.customer_name,
       transactions.transaction_id,
       transactions.amount
FROM customers
LEFT JOIN transactions
    ON customers.customer_id = transactions.customer_id
ORDER BY customers.customer_name ASC,
         transactions.amount DESC;


-- ============================================================
-- SECTION 2: FINDING UNMATCHED RECORDS
-- ============================================================

-- Task 3
-- Find customers who do not have any transactions.
--
-- Use IS NULL.

SELECT *
FROM customers
LEFT JOIN transactions
    ON customers.customer_id = transactions.customer_id
WHERE transactions.transaction_id IS NULL;


-- Task 4
-- Display all Business customers, including Business customers
-- who do not have any transactions.
--
-- Show:
-- customer_name
-- customer_type
-- transaction_id
-- amount

SELECT customers.customer_name,
       customers.customer_type,
       transactions.transaction_id,
       transactions.amount
FROM customers
LEFT JOIN transactions
    ON customers.customer_id = transactions.customer_id
WHERE customers.customer_type = 'Business';


-- ============================================================
-- SECTION 3: ON vs WHERE
-- ============================================================

-- Task 5
-- Display all customers and their Completed transactions.
--
-- IMPORTANT:
-- Customers without Completed transactions must also remain
-- in the result.
--
-- The filtering condition should therefore be placed
-- in the ON clause.

SELECT *
FROM customers
LEFT JOIN transactions
    ON customers.customer_id = transactions.customer_id
   AND transactions.status = 'Completed';


-- Task 6
-- Display customers who have transactions above 10,000.
--
-- Show:
-- customer_name
-- customer_type
-- transaction_id
-- amount
--
-- Sort by amount descending.

SELECT customers.customer_name,
       customers.customer_type,
       transactions.transaction_id,
       transactions.amount
FROM customers
LEFT JOIN transactions
    ON customers.customer_id = transactions.customer_id
WHERE transactions.amount > 10000
ORDER BY transactions.amount DESC;


-- ============================================================
-- SECTION 4: COMPARING DATA FROM TWO TABLES
-- ============================================================

-- Task 7
-- Find transactions made in a country different from
-- the customer's home country.
--
-- Show:
-- customer_name
-- customer_country
-- transaction_country
-- transaction_id
-- amount

SELECT customers.customer_name,
       customers.country AS customer_country,
       transactions.country AS transaction_country,
       transactions.transaction_id,
       transactions.amount
FROM customers
LEFT JOIN transactions
    ON customers.customer_id = transactions.customer_id
WHERE customers.country != transactions.country;


-- ============================================================
-- SECTION 5: TRANSACTION MONITORING
-- ============================================================

-- Task 8
-- Find all customers who do not have any transactions.
--
-- Show:
-- customer_id
-- customer_name
-- customer_type
--
-- Analytical question:
-- Why could customers without transactions be relevant
-- in a data analysis context?

SELECT customers.customer_id,
       customers.customer_name,
       customers.customer_type
FROM customers
LEFT JOIN transactions
    ON customers.customer_id = transactions.customer_id
WHERE transactions.transaction_id IS NULL;


-- Task 9
-- Display every customer and any transaction matching ALL
-- of the following conditions:
--
-- - Completed
-- - Transfer
-- - Amount above 8,000
--
-- Customers without a matching transaction must also
-- remain in the result.
--
-- Show:
-- customer_name
-- customer_type
-- transaction_id
-- amount
-- country
-- status

SELECT customers.customer_name,
       customers.customer_type,
       transactions.transaction_id,
       transactions.amount,
       transactions.country,
       transactions.status
FROM customers
LEFT JOIN transactions
    ON customers.customer_id = transactions.customer_id
   AND transactions.status = 'Completed'
   AND transactions.transaction_type = 'Transfer'
   AND transactions.amount > 8000;


-- ============================================================
-- SECTION 6: HIGH-VALUE TRANSACTIONS
-- ============================================================

-- Task 10
-- Display every customer and any high-value transaction.
--
-- High-value transaction:
-- amount >= 10,000
--
-- Customers without high-value transactions must also
-- be included.
--
-- Show:
-- customer_name
-- customer_type
-- transaction_id
-- amount
-- currency
-- country
--
-- Sort by:
-- customer_name ASC
-- amount DESC

SELECT customers.customer_name,
       customers.customer_type,
       transactions.transaction_id,
       transactions.amount,
       transactions.currency,
       transactions.country
FROM customers
LEFT JOIN transactions
    ON customers.customer_id = transactions.customer_id
   AND transactions.amount >= 10000
ORDER BY customers.customer_name ASC,
         transactions.amount DESC;


-- ============================================================
-- KEY CONCEPTS
-- ============================================================

/*
LEFT JOIN
    Returns all records from the left table,
    even when there is no matching record in the right table.


NULL AFTER LEFT JOIN
    When no matching record exists in the right table,
    columns from the right table contain NULL.


IS NULL
    Can be used to identify records with no match.

Example:

WHERE transactions.transaction_id IS NULL


ON vs WHERE
    Conditions placed in ON determine which records
    from the right table are matched.

    Conditions placed in WHERE filter the final result.

    This distinction is especially important when using
    LEFT JOINs.


Example:

FROM customers
LEFT JOIN transactions
    ON customers.customer_id = transactions.customer_id
   AND transactions.amount >= 10000

This keeps ALL customers while only matching
high-value transactions.


ANALYTICAL APPLICATIONS
    LEFT JOINs are useful when the analysis must preserve
    the complete population from one table.

Examples:
- customers with no transactions
- accounts with no activity
- products with no sales
- employees without assigned projects
- customers without high-value transactions


TRANSACTION MONITORING APPLICATIONS
    LEFT JOINs can be used to identify customers or accounts
    with missing activity, compare customer attributes
    against transaction behaviour, and preserve the full
    customer population during investigations.
*/
