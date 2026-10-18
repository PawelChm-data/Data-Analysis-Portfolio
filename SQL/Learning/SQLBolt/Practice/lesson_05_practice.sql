/*
SQL Lesson 5 - Practice / SQL Review

Topics covered:
- SELECT
- WHERE
- AND / OR
- IN / NOT IN
- DISTINCT
- ORDER BY
- ASC / DESC
- LIMIT
- OFFSET
- Combining multiple SQL clauses

Dataset:
Synthetic transaction data created for educational purposes.

This file contains practical exercises based on SQLBolt
Lesson 5 review concepts.
*/


-- ============================================================
-- SECTION 1: BASIC FILTERING
-- ============================================================

-- Task 1
-- Show transaction_id, customer_id and amount
-- for all transactions above 5,000.

SELECT transaction_id, customer_id, amount
FROM transactions
WHERE amount > 5000;


-- Task 2
-- Show transaction_id, country and amount
-- for transactions made in Poland, Germany or the Netherlands.

SELECT transaction_id, country, amount
FROM transactions
WHERE country IN ('PL', 'DE', 'NL');


-- ============================================================
-- SECTION 2: FILTERING + SORTING
-- ============================================================

-- Task 3
-- Find all Card Payment transactions below 1,000.
-- Sort them from the highest amount to the lowest.

SELECT *
FROM transactions
WHERE transaction_type = 'Card Payment'
  AND amount < 1000
ORDER BY amount DESC;


-- Task 4
-- Find all EUR transactions with an amount of at least 8,000.
-- Sort them from the highest amount to the lowest.

SELECT *
FROM transactions
WHERE currency = 'EUR'
  AND amount >= 8000
ORDER BY amount DESC;


-- Task 5
-- Find all Transfer transactions that are not Failed or Declined.
-- Sort them from the highest amount to the lowest.

SELECT *
FROM transactions
WHERE transaction_type = 'Transfer'
  AND status NOT IN ('Failed', 'Declined')
ORDER BY amount DESC;


-- ============================================================
-- SECTION 3: LIMIT
-- ============================================================

-- Task 6
-- Show the 5 largest EUR transactions.
-- Return only transaction_id, customer_id, amount,
-- currency and country.

SELECT transaction_id, customer_id, amount, currency, country
FROM transactions
WHERE currency = 'EUR'
ORDER BY amount DESC
LIMIT 5;


-- ============================================================
-- SECTION 4: DISTINCT
-- ============================================================

-- Task 7
-- Show all unique countries where Transfer transactions
-- have taken place.

SELECT DISTINCT country
FROM transactions
WHERE transaction_type = 'Transfer';


-- Task 8
-- Show all unique currencies used in transactions
-- with an amount greater than 5,000.

SELECT DISTINCT currency
FROM transactions
WHERE amount > 5000;


-- ============================================================
-- SECTION 5: MULTIPLE CONDITIONS
-- ============================================================

-- Task 9
-- Show the 3 largest Completed transactions
-- made in EUR outside Poland.
--
-- Return:
-- transaction_id
-- customer_id
-- amount
-- currency
-- country
-- status

SELECT transaction_id, customer_id, amount, currency, country, status
FROM transactions
WHERE currency = 'EUR'
  AND country != 'PL'
  AND status = 'Completed'
ORDER BY amount DESC
LIMIT 3;


-- Task 10
-- Show the second and third largest transactions
-- made by customer 502.

SELECT *
FROM transactions
WHERE customer_id = 502
ORDER BY amount DESC
LIMIT 2
OFFSET 1;


-- ============================================================
-- SECTION 6: DATA ANALYSIS
-- ============================================================

-- Task 11
-- Show the 5 largest Completed transactions
-- made in Germany, the Netherlands or the United States.

SELECT *
FROM transactions
WHERE country IN ('DE', 'NL', 'US')
  AND status = 'Completed'
ORDER BY amount DESC
LIMIT 5;


-- Task 12
-- Identify all Completed EUR Transfers above 8,000
-- made outside Poland.
--
-- Sort the results from the highest amount
-- to the lowest.

SELECT *
FROM transactions
WHERE transaction_type = 'Transfer'
  AND status = 'Completed'
  AND amount > 8000
  AND country != 'PL'
  AND currency = 'EUR'
ORDER BY amount DESC;


-- ============================================================
-- ANALYTICAL NOTE
-- ============================================================

/*
The exercises above combine multiple SQL clauses to answer
practical data analysis questions.

Key skills practiced:

- Filtering records with WHERE
- Combining conditions with AND
- Filtering lists with IN and NOT IN
- Removing duplicate values with DISTINCT
- Sorting results with ORDER BY
- Limiting results with LIMIT
- Skipping records with OFFSET
- Combining multiple clauses into analytical queries

These concepts form the foundation for more advanced SQL,
including JOINs, GROUP BY, aggregate functions and eventually
more advanced analytical queries.
*/
