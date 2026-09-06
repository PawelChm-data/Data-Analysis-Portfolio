/*
SQL Lesson 6 - JOINs Practice

Topics covered:
- INNER JOIN
- Joining tables using a common column
- ON clause
- Filtering joined data with WHERE
- Sorting joined results with ORDER BY
- LIMIT
- Comparing columns from different tables

Tables used:
- transactions
- customers

Common key:
- customer_id

Dataset:
Synthetic transaction data created for educational purposes.
*/


-- ============================================================
-- SECTION 1: BASIC INNER JOIN
-- ============================================================

-- Task 1
-- Join transactions with customers.
-- Show:
-- transaction_id
-- customer_id
-- customer_name
-- amount

SELECT transaction_id, transactions.customer_id, customer_name, amount
FROM transactions
INNER JOIN customers
    ON transactions.customer_id = customers.customer_id;


-- Task 2
-- Show:
-- customer_name
-- transaction_id
-- amount
-- currency
-- for all transactions.

SELECT customer_name, transaction_id, amount, currency
FROM transactions
INNER JOIN customers
    ON transactions.customer_id = customers.customer_id;


-- Task 3
-- Find all transactions made by John Smith.
-- Show:
-- transaction_id
-- customer_name
-- amount
-- country
-- status

SELECT transaction_id, customer_name, amount,
       transactions.country, status
FROM transactions
INNER JOIN customers
    ON transactions.customer_id = customers.customer_id
WHERE customer_name = 'John Smith';


-- ============================================================
-- SECTION 2: JOIN + WHERE
-- ============================================================

-- Task 4
-- Find all transactions made by Business customers.
-- Show:
-- transaction_id
-- customer_name
-- customer_type
-- amount

SELECT transaction_id, customer_name, customer_type, amount
FROM transactions
INNER JOIN customers
    ON transactions.customer_id = customers.customer_id
WHERE customer_type = 'Business';


-- Task 5
-- Find all Completed Transfer transactions
-- made by Business customers.
-- Sort from the highest amount to the lowest.

SELECT *
FROM transactions
INNER JOIN customers
    ON transactions.customer_id = customers.customer_id
WHERE status = 'Completed'
  AND transaction_type = 'Transfer'
  AND customer_type = 'Business'
ORDER BY amount DESC;


-- Task 6
-- Find all transactions made by John Smith
-- with an amount above 8,000.
-- Sort from the highest amount to the lowest.

SELECT *
FROM transactions
INNER JOIN customers
    ON transactions.customer_id = customers.customer_id
WHERE customer_name = 'John Smith'
  AND amount > 8000
ORDER BY amount DESC;


-- ============================================================
-- SECTION 3: COMPARING DATA FROM TWO TABLES
-- ============================================================

-- Task 7
-- Find all transactions where the country of the transaction
-- is different from the customer's home country.
--
-- Show all available transaction and customer information.

SELECT *
FROM transactions
INNER JOIN customers
    ON transactions.customer_id = customers.customer_id
WHERE customers.country != transactions.country;


-- ============================================================
-- SECTION 4: JOIN + ORDER BY + LIMIT
-- ============================================================

-- Task 8
-- Find the 3 largest transactions made by Business customers.
-- Sort from the highest amount to the lowest.

SELECT *
FROM transactions
INNER JOIN customers
    ON transactions.customer_id = customers.customer_id
WHERE customer_type = 'Business'
ORDER BY amount DESC
LIMIT 3;


-- ============================================================
-- SECTION 5: DATA ANALYSIS / TRANSACTION MONITORING
-- ============================================================

-- Task 9
-- Find all:
-- - Transfer transactions
-- - Completed
-- - Above 8,000
-- - Made by Individual customers
-- - Where the transaction country differs from
--   the customer's home country
--
-- Show:
-- customer_name
-- customer country
-- transaction country
-- transaction_id
-- amount
-- currency
-- status

SELECT customer_name,
       customers.country AS customer_country,
       transactions.country AS transaction_country,
       transaction_id,
       amount,
       currency,
       status
FROM transactions
INNER JOIN customers
    ON transactions.customer_id = customers.customer_id
WHERE transaction_type = 'Transfer'
  AND status = 'Completed'
  AND amount > 8000
  AND customer_type = 'Individual'
  AND customers.country != transactions.country;


-- ============================================================
-- SECTION 6: MULTIPLE SORTING CONDITIONS
-- ============================================================

-- Task 10
-- Show:
-- customer_name
-- transaction_id
-- amount
--
-- Sort first by customer_name alphabetically
-- and then by amount from highest to lowest.

SELECT customer_name, transaction_id, amount
FROM transactions
INNER JOIN customers
    ON transactions.customer_id = customers.customer_id
ORDER BY customer_name ASC, amount DESC;


-- ============================================================
-- KEY CONCEPTS
-- ============================================================

/*
INNER JOIN
    Returns records where a matching value exists
    in both tables.

ON
    Defines how the tables are connected.

Example:

FROM transactions
INNER JOIN customers
    ON transactions.customer_id = customers.customer_id


TABLE QUALIFICATION
    When multiple tables contain columns with the same name,
    specify the table explicitly.

Example:

customers.country
transactions.country


JOIN + WHERE
    Allows filtering data after combining multiple tables.


JOIN + ORDER BY
    Allows joined data to be sorted.


JOIN + LIMIT
    Can be used to identify top-N records
    from joined datasets.


ANALYTICAL APPLICATIONS
    JOINs allow analysts to combine transaction data
    with customer information and investigate relationships
    between transactional behaviour and customer attributes.
*/
