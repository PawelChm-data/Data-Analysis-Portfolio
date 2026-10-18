/*
============================================================
SQL REVIEW — LESSONS 1–8
============================================================

Topics covered:
- SELECT
- WHERE
- AND / OR
- IN / NOT IN
- LIKE
- DISTINCT
- ORDER BY
- LIMIT / OFFSET
- INNER JOIN
- LEFT JOIN
- IS NULL / IS NOT NULL

Tables used:
- transactions
- customers

Dataset:
Synthetic transaction and customer data created
for educational purposes.

============================================================
BASIC SELECT & FILTERING
============================================================
*/


-- ============================================================
-- Task 1 — SELECT
-- ============================================================
-- Display:
-- transaction_id
-- customer_id
-- amount
-- currency

SELECT transaction_id,
       customer_id,
       amount,
       currency
FROM transactions;


-- ============================================================
-- Task 2 — WHERE
-- ============================================================
-- Find all transactions with an amount greater than 8000.

SELECT *
FROM transactions
WHERE amount > 8000;


-- ============================================================
-- Task 3 — AND
-- ============================================================
-- Find transactions that:
-- - use EUR
-- - have an amount of at least 8000
-- - are from Germany

SELECT *
FROM transactions
WHERE currency = 'EUR'
  AND amount >= 8000
  AND country = 'DE';


-- ============================================================
-- Task 4 — OR
-- ============================================================
-- Find transactions with status:
-- - Failed
-- - Declined

SELECT *
FROM transactions
WHERE status = 'Failed'
   OR status = 'Declined';


-- ============================================================
-- Task 5 — IN
-- ============================================================
-- Find transactions from:
-- PL, DE or NL

SELECT *
FROM transactions
WHERE country IN ('PL', 'DE', 'NL');


-- ============================================================
-- Task 6 — NOT IN
-- ============================================================
-- Find transactions that are NOT from:
-- PL, DE or NL

SELECT *
FROM transactions
WHERE country NOT IN ('PL', 'DE', 'NL');


-- ============================================================
-- Task 7 — LIKE
-- ============================================================
-- Find transactions where transaction_type
-- ends with "ment".

SELECT *
FROM transactions
WHERE transaction_type LIKE '%ment';


-- ============================================================
-- Task 8 — DISTINCT
-- ============================================================
-- Display all unique countries in the transactions table.

SELECT DISTINCT country
FROM transactions;


-- ============================================================
-- Task 9 — DISTINCT + WHERE
-- ============================================================
-- Display unique currencies used by transactions
-- with an amount greater than 5000.

SELECT DISTINCT currency
FROM transactions
WHERE amount > 5000;


/*
============================================================
SORTING & LIMITING
============================================================
*/


-- ============================================================
-- Task 10 — ORDER BY
-- ============================================================
-- Display all transactions from the highest amount
-- to the lowest.

SELECT *
FROM transactions
ORDER BY amount DESC;


-- ============================================================
-- Task 11 — WHERE + ORDER BY
-- ============================================================
-- Find Completed Transfer transactions
-- and sort them from highest to lowest amount.

SELECT *
FROM transactions
WHERE transaction_type = 'Transfer'
  AND status = 'Completed'
ORDER BY amount DESC;


-- ============================================================
-- Task 12 — LIMIT
-- ============================================================
-- Display the three largest transactions.

SELECT *
FROM transactions
ORDER BY amount DESC
LIMIT 3;


-- ============================================================
-- Task 13 — LIMIT + OFFSET
-- ============================================================
-- Display transactions ranked 4th–6th
-- by transaction amount.

SELECT *
FROM transactions
ORDER BY amount DESC
LIMIT 3 OFFSET 3;


/*
============================================================
INNER JOIN
============================================================
*/


-- ============================================================
-- Task 14 — INNER JOIN
-- ============================================================
-- Join customers and transactions.
--
-- Display:
-- customer_name
-- transaction_id
-- amount

SELECT customers.customer_name,
       transactions.transaction_id,
       transactions.amount
FROM customers
INNER JOIN transactions
    ON customers.customer_id = transactions.customer_id;


-- ============================================================
-- Task 15 — INNER JOIN + WHERE
-- ============================================================
-- Find transactions belonging to Business customers.
--
-- Display:
-- customer_name
-- customer_type
-- transaction_id
-- amount

SELECT customers.customer_name,
       customers.customer_type,
       transactions.transaction_id,
       transactions.amount
FROM customers
INNER JOIN transactions
    ON customers.customer_id = transactions.customer_id
WHERE customers.customer_type = 'Business';


-- ============================================================
-- Task 16 — INNER JOIN + multiple conditions
-- ============================================================
-- Find transactions that:
-- - are Transfers
-- - are Completed
-- - have amount > 8000
-- - belong to Business customers
--
-- Sort by amount descending.

SELECT customers.customer_name,
       customers.customer_type,
       transactions.transaction_id,
       transactions.amount,
       transactions.currency,
       transactions.country
FROM customers
INNER JOIN transactions
    ON customers.customer_id = transactions.customer_id
WHERE transactions.transaction_type = 'Transfer'
  AND transactions.status = 'Completed'
  AND transactions.amount > 8000
  AND customers.customer_type = 'Business'
ORDER BY transactions.amount DESC;


/*
============================================================
LEFT JOIN & NULL
============================================================
*/


-- ============================================================
-- Task 17 — LEFT JOIN
-- ============================================================
-- Display all customers together with their transactions.
--
-- Customers without transactions must also be included.
--
-- Display:
-- customer_id
-- customer_name
-- transaction_id
-- amount

SELECT customers.customer_id,
       customers.customer_name,
       transactions.transaction_id,
       transactions.amount
FROM customers
LEFT JOIN transactions
    ON customers.customer_id = transactions.customer_id;


-- ============================================================
-- Task 18 — LEFT JOIN + IS NULL
-- ============================================================
-- Find customers who have no transactions.
--
-- Display:
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
-- Task 19 — IS NULL
-- ============================================================
-- Find transactions where status is NULL.

SELECT *
FROM transactions
WHERE status IS NULL;


-- ============================================================
-- Task 20 — IS NOT NULL
-- ============================================================
-- Find transactions where:
-- - currency is NOT NULL
-- - amount is NOT NULL
-- - status is NOT NULL

SELECT *
FROM transactions
WHERE currency IS NOT NULL
  AND amount IS NOT NULL
  AND status IS NOT NULL;


/*
============================================================
MIXED REVIEW
============================================================
*/


-- ============================================================
-- Task 21 — Mixed filtering + LIMIT
-- ============================================================
-- Find the three largest transactions that:
-- - are Transfers
-- - are Completed
-- - use EUR
-- - are not from Poland

SELECT *
FROM transactions
WHERE transaction_type = 'Transfer'
  AND status = 'Completed'
  AND currency = 'EUR'
  AND country != 'PL'
ORDER BY amount DESC
LIMIT 3;


-- ============================================================
-- Task 22 — DISTINCT combination
-- ============================================================
-- Display unique country + currency combinations
-- for transactions with an amount greater than 5000.

SELECT DISTINCT country,
                currency
FROM transactions
WHERE amount > 5000;


-- ============================================================
-- Task 23 — JOIN + filtering + sorting
-- ============================================================
-- Find transactions:
-- - from Germany or the Netherlands
-- - Transfer
-- - Completed
-- - amount >= 8000
--
-- Display:
-- customer_name
-- customer_type
-- transaction_id
-- amount
-- currency
-- country
--
-- Sort by amount descending.

SELECT customers.customer_name,
       customers.customer_type,
       transactions.transaction_id,
       transactions.amount,
       transactions.currency,
       transactions.country
FROM customers
INNER JOIN transactions
    ON customers.customer_id = transactions.customer_id
WHERE transactions.country IN ('DE', 'NL')
  AND transactions.transaction_type = 'Transfer'
  AND transactions.status = 'Completed'
  AND transactions.amount >= 8000
ORDER BY transactions.amount DESC;


-- ============================================================
-- Task 24 — LEFT JOIN + multiple-column sorting
-- ============================================================
-- Display all customers and their transactions.
--
-- Customers without transactions must also be included.
--
-- Sort:
-- 1. customer_name ASC
-- 2. amount DESC

SELECT *
FROM customers
LEFT JOIN transactions
    ON customers.customer_id = transactions.customer_id
ORDER BY customers.customer_name ASC,
         transactions.amount DESC;


-- ============================================================
-- Task 25 — Final review
-- ============================================================
-- Join customers and transactions.
--
-- Find transactions that:
-- - amount >= 8000
-- - currency = EUR
-- - country is DE or NL
-- - transaction_type = Transfer
-- - status = Completed
--
-- Display:
-- customer_name
-- customer_type
-- transaction_id
-- amount
-- currency
-- country
-- status
--
-- Sort by amount descending.

SELECT customers.customer_name,
       customers.customer_type,
       transactions.transaction_id,
       transactions.amount,
       transactions.currency,
       transactions.country,
       transactions.status
FROM customers
INNER JOIN transactions
    ON customers.customer_id = transactions.customer_id
WHERE transactions.amount >= 8000
  AND transactions.currency = 'EUR'
  AND transactions.country IN ('DE', 'NL')
  AND transactions.transaction_type = 'Transfer'
  AND transactions.status = 'Completed'
ORDER BY transactions.amount DESC;


/*
============================================================
REVIEW SUMMARY
============================================================

SQLBolt Lessons covered:

Lesson 1 — SELECT queries
Lesson 2 — Queries with constraints
Lesson 3 — Constraints Part 2
Lesson 4 — Filtering and sorting
Lesson 5 — SELECT review
Lesson 6 — INNER JOIN
Lesson 7 — OUTER JOIN / LEFT JOIN
Lesson 8 — NULL

NOT COVERED YET:
- GROUP BY
- HAVING
- Aggregate functions
- Subqueries
- EXISTS / NOT EXISTS
- CASE
- Window functions

These will be added only after learning them in SQLBolt.
============================================================
*/
