-- ============================================================
-- SQL Practice - Lesson 10: Aggregate Functions
-- Based on SQLBolt Lesson 10
-- Dataset: transactions + customers
--
-- Topics:
-- COUNT()
-- SUM()
-- AVG()
-- MIN()
-- MAX()
-- GROUP BY
-- ============================================================


-- ============================================================
-- TASK 1
-- Count the total number of transactions.
--
-- Expected column:
-- transaction_count
-- ============================================================

SELECT COUNT(transaction_id) AS transaction_count
FROM transactions;


-- ============================================================
-- TASK 2
-- Calculate the total value of all transactions.
--
-- Expected column:
-- total_amount
-- ============================================================

SELECT SUM(amount) AS total_amount
FROM transactions;


-- ============================================================
-- TASK 3
-- Calculate the average transaction amount.
--
-- Expected column:
-- average_amount
-- ============================================================

SELECT AVG(amount) AS average_amount
FROM transactions;


-- ============================================================
-- TASK 4
-- Find the minimum and maximum transaction amounts.
--
-- Expected columns:
-- minimum_amount
-- maximum_amount
-- ============================================================

SELECT MIN(amount) AS minimum_amount,
       MAX(amount) AS maximum_amount
FROM transactions;


-- ============================================================
-- TASK 5
-- Count how many transactions have the status 'Completed'.
--
-- Expected column:
-- transaction_count
-- ============================================================

SELECT COUNT(transaction_id) AS transaction_count
FROM transactions
WHERE status = 'Completed';


-- ============================================================
-- TASK 6
-- Calculate the total value of all Completed transactions.
--
-- Expected column:
-- total_amount
-- ============================================================

SELECT SUM(amount) AS total_amount
FROM transactions
WHERE status = 'Completed';


-- ============================================================
-- TASK 7
-- Calculate the average value of Completed Transfers.
--
-- Conditions:
-- status = 'Completed'
-- transaction_type = 'Transfer'
--
-- Expected column:
-- average_amount
-- ============================================================

SELECT AVG(amount) AS average_amount
FROM transactions
WHERE status = 'Completed'
  AND transaction_type = 'Transfer';


-- ============================================================
-- TASK 8
-- Count the number of transactions for each country.
--
-- Expected columns:
-- country
-- transaction_count
-- ============================================================

SELECT country,
       COUNT(*) AS transaction_count
FROM transactions
GROUP BY country;


-- ============================================================
-- TASK 9
-- Calculate the total transaction value for each country.
--
-- Expected columns:
-- country
-- total_amount
-- ============================================================

SELECT country,
       SUM(amount) AS total_amount
FROM transactions
GROUP BY country;


-- ============================================================
-- TASK 10
-- Calculate the average transaction amount for each currency.
--
-- Expected columns:
-- currency
-- average_amount
-- ============================================================

SELECT currency,
       AVG(amount) AS average_amount
FROM transactions
GROUP BY currency;


-- ============================================================
-- TASK 11
-- Count the number of transactions for each transaction type.
--
-- Expected columns:
-- transaction_type
-- transaction_count
-- ============================================================

SELECT transaction_type,
       COUNT(transaction_id) AS transaction_count
FROM transactions
GROUP BY transaction_type;


-- ============================================================
-- TASK 12
-- Calculate the total transaction value for each transaction type.
--
-- Expected columns:
-- transaction_type
-- total_amount
-- ============================================================

SELECT transaction_type,
       SUM(amount) AS total_amount
FROM transactions
GROUP BY transaction_type;


-- ============================================================
-- TASK 13
-- For each transaction status, calculate:
-- - number of transactions
-- - total transaction value
--
-- Expected columns:
-- status
-- transaction_count
-- total_amount
-- ============================================================

SELECT status,
       COUNT(transaction_id) AS transaction_count,
       SUM(amount) AS total_amount
FROM transactions
GROUP BY status;


-- ============================================================
-- TASK 14 - CHALLENGE
-- For each country, calculate:
-- - number of transactions
-- - average transaction amount
-- - maximum transaction amount
--
-- Expected columns:
-- country
-- transaction_count
-- average_amount
-- maximum_amount
-- ============================================================

SELECT country,
       COUNT(transaction_id) AS transaction_count,
       AVG(amount) AS average_amount,
       MAX(amount) AS maximum_amount
FROM transactions
GROUP BY country;


-- ============================================================
-- REVIEW - LESSON 10
-- ============================================================


-- REVIEW 1
-- Count all transactions.

SELECT COUNT(transaction_id) AS transaction_count
FROM transactions;


-- REVIEW 2
-- Calculate the total value of Completed transactions.

SELECT SUM(amount) AS total_amount
FROM transactions
WHERE status = 'Completed';


-- REVIEW 3
-- Calculate the average value of Completed Transfers.

SELECT AVG(amount) AS average_amount
FROM transactions
WHERE status = 'Completed'
  AND transaction_type = 'Transfer';


-- REVIEW 4
-- Count transactions for each transaction type.

SELECT transaction_type,
       COUNT(transaction_id) AS transaction_count
FROM transactions
GROUP BY transaction_type;


-- REVIEW 5
-- Calculate the total transaction value for each country.

SELECT country,
       SUM(amount) AS total_amount
FROM transactions
GROUP BY country;


-- REVIEW 6 - FINAL
-- For each status, show:
-- - number of transactions
-- - total value
-- - average transaction amount

SELECT status,
       COUNT(transaction_id) AS transaction_count,
       SUM(amount) AS total_amount,
       AVG(amount) AS average_amount
FROM transactions
GROUP BY status;
