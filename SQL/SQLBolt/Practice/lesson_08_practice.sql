/*
SQL Lesson 8 - NULL Practice

Topics covered:
- NULL values
- IS NULL
- IS NOT NULL
- LEFT JOIN
- Identifying missing data
- Filtering NULL values
- Combining NULL conditions with WHERE

Tables used:
- customers
- transactions

Common key:
- customer_id

Dataset:
Synthetic transaction data created for educational purposes.
*/


-- ============================================================
-- SECTION 1: IS NULL
-- ============================================================

-- Task 1
-- Find all transactions where the status is NULL.
--
-- Show:
-- transaction_id
-- customer_id
-- amount
-- status

SELECT transaction_id,
       customer_id,
       amount,
       status
FROM transactions
WHERE status IS NULL;


-- ============================================================
-- SECTION 2: IS NOT NULL
-- ============================================================

-- Task 2
-- Find all transactions where currency is NOT NULL.
--
-- Show:
-- transaction_id
-- amount
-- currency

SELECT transaction_id,
       amount,
       currency
FROM transactions
WHERE currency IS NOT NULL;


-- ============================================================
-- SECTION 3: LEFT JOIN + NULL
-- ============================================================

-- Task 3
-- Find all customers who do not have any transactions.
--
-- Show:
-- customer_id
-- customer_name
-- customer_type

SELECT customers.customer_id,
       customers.customer_name,
       customers.customer_type
FROM customers
LEFT JOIN transactions
    ON customers.customer_id = transactions.customer_id
WHERE transactions.transaction_id IS NULL;


-- ============================================================
-- SECTION 4: NULL + OTHER CONDITIONS
-- ============================================================

-- Task 4
-- Find all transactions that:
--
-- - have status = 'Completed'
-- - have a non-NULL amount
--
-- Show:
-- transaction_id
-- amount
-- status

SELECT transaction_id,
       amount,
       status
FROM transactions
WHERE status = 'Completed'
  AND amount IS NOT NULL;


-- ============================================================
-- SECTION 5: LEFT JOIN WITH NULL VALUES
-- ============================================================

-- Task 5
-- Display all customers together with their transactions.
--
-- Customers without transactions must also be included.
--
-- Show:
-- customer_name
-- transaction_id
-- amount
--
-- Sort by customer_name alphabetically.

SELECT customers.customer_name,
       transactions.transaction_id,
       transactions.amount
FROM customers
LEFT JOIN transactions
    ON customers.customer_id = transactions.customer_id
ORDER BY customers.customer_name ASC;


-- ============================================================
-- SECTION 6: COMBINING NULL CONDITIONS
-- ============================================================

-- Task 6
-- Find all transactions that:
--
-- - use EUR
-- - have a non-NULL amount
-- - have a non-NULL status
--
-- Sort from the highest amount to the lowest.

SELECT *
FROM transactions
WHERE currency = 'EUR'
  AND amount IS NOT NULL
  AND status IS NOT NULL
ORDER BY amount DESC;


-- ============================================================
-- KEY CONCEPTS
-- ============================================================

/*
NULL
    Represents a missing or unknown value.

    NULL is NOT the same as:
    - 0
    - ''
    - FALSE
    - 'NULL'


Checking for NULL:

    IS NULL

Example:

    WHERE status IS NULL


Checking for a value that exists:

    IS NOT NULL

Example:

    WHERE status IS NOT NULL


IMPORTANT:
    Do NOT use:

    WHERE status = NULL

    or:

    WHERE status != NULL

    Use IS NULL / IS NOT NULL instead.


LEFT JOIN + NULL

A common pattern for finding records without
a matching record in another table:

    SELECT *
    FROM customers
    LEFT JOIN transactions
        ON customers.customer_id = transactions.customer_id
    WHERE transactions.transaction_id IS NULL;


This means:

    "Return customers for whom no matching transaction
     was found."


NULL after LEFT JOIN

When a LEFT JOIN cannot find a matching record,
columns from the right-hand table contain NULL.


Example:

    customer_id = 509
    transaction_id = NULL
    amount = NULL


This allows NULL values to be used to identify
missing relationships between datasets.
*/
