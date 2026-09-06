/*
SQL Lesson 4 - Practice

Topics covered:
- DISTINCT
- ORDER BY
- ASC / DESC
- LIMIT
- OFFSET
- Combining WHERE, ORDER BY and LIMIT

Dataset:
Synthetic transaction data created for educational purposes.

This file contains practical exercises based on SQLBolt
Lesson 4 concepts.
*/


-- ============================================================
-- SECTION 1: DISTINCT
-- ============================================================

-- Task 1
-- Show all unique countries present in the dataset.

SELECT DISTINCT country
FROM transactions;


-- Task 2
-- Show all unique currencies present in the dataset.

SELECT DISTINCT currency
FROM transactions;


-- Task 3
-- Show all unique combinations of country and currency.

SELECT DISTINCT country, currency
FROM transactions;


-- ============================================================
-- SECTION 2: ORDER BY
-- ============================================================

-- Task 4
-- Display all transactions ordered by amount
-- from the smallest to the largest.

SELECT *
FROM transactions
ORDER BY amount ASC;


-- Task 5
-- Display all transactions ordered by amount
-- from the largest to the smallest.

SELECT *
FROM transactions
ORDER BY amount DESC;


-- Task 6
-- Display transaction_id, customer_id and amount.
-- Sort the results from the highest amount to the lowest.

SELECT transaction_id, customer_id, amount
FROM transactions
ORDER BY amount DESC;


-- ============================================================
-- SECTION 3: WHERE + ORDER BY
-- ============================================================

-- Task 7
-- Find all EUR transactions.
-- Sort them from the highest amount to the lowest.

SELECT *
FROM transactions
WHERE currency = 'EUR'
ORDER BY amount DESC;


-- Task 8
-- Find all completed Transfer transactions.
-- Sort them from the highest amount to the lowest.

SELECT *
FROM transactions
WHERE transaction_type = 'Transfer'
  AND status = 'Completed'
ORDER BY amount DESC;


-- ============================================================
-- SECTION 4: LIMIT
-- ============================================================

-- Task 9
-- Find the 3 largest transactions in the dataset.

SELECT *
FROM transactions
ORDER BY amount DESC
LIMIT 3;


-- Task 10
-- Find the 3 largest completed transfers
-- made outside Poland.

SELECT *
FROM transactions
WHERE transaction_type = 'Transfer'
  AND status = 'Completed'
  AND country != 'PL'
ORDER BY amount DESC
LIMIT 3;


-- ============================================================
-- SECTION 5: OFFSET
-- ============================================================

-- Task 11
-- Find transactions ranked 4th to 6th
-- by transaction amount.

SELECT *
FROM transactions
ORDER BY amount DESC
LIMIT 3
OFFSET 3;


-- ============================================================
-- ANALYTICAL NOTES
-- ============================================================

/*
Key concepts practiced:

DISTINCT
    Used to return unique values or unique combinations of values.

ORDER BY
    Used to sort query results.

ASC
    Sorts values in ascending order.

DESC
    Sorts values in descending order.

LIMIT
    Restricts the number of rows returned.

OFFSET
    Skips a specified number of rows before returning results.

Combining these clauses allows us to answer practical
business and data analysis questions such as:

- What countries are present in the dataset?
- What are the largest transactions?
- What are the largest completed transfers?
- What are the top 3 transactions outside Poland?
*/
