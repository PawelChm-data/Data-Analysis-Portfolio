-- ============================================================
-- SQL Practice - Lesson 11
-- GROUP BY + HAVING
--
-- Dataset: transactions
--
-- Topics:
-- GROUP BY
-- HAVING
-- COUNT()
-- SUM()
-- AVG()
--
-- Practice exercises based on SQLBolt Lesson 11
-- ============================================================


-- ============================================================
-- TASK 1
-- Count the number of transactions for each country.
--
-- Expected columns:
-- country
-- transaction_count
-- ============================================================

SELECT country,
       COUNT(transaction_id) AS transaction_count
FROM transactions
GROUP BY country;


-- ============================================================
-- TASK 2
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
-- TASK 3
-- Show only countries that have more than 1 transaction.
--
-- Expected columns:
-- country
-- transaction_count
-- ============================================================

SELECT country,
       COUNT(transaction_id) AS transaction_count
FROM transactions
GROUP BY country
HAVING COUNT(transaction_id) > 1;


-- ============================================================
-- TASK 4
-- Show countries where the total transaction value
-- is greater than 15,000.
--
-- Expected columns:
-- country
-- total_amount
-- ============================================================

SELECT country,
       SUM(amount) AS total_amount
FROM transactions
GROUP BY country
HAVING SUM(amount) > 15000;


-- ============================================================
-- TASK 5
-- For each currency, calculate:
-- - number of transactions
-- - average transaction amount
--
-- Expected columns:
-- currency
-- transaction_count
-- average_amount
-- ============================================================

SELECT currency,
       COUNT(transaction_id) AS transaction_count,
       AVG(amount) AS average_amount
FROM transactions
GROUP BY currency;


-- ============================================================
-- TASK 6
-- Show only currencies where the average transaction amount
-- is greater than 5,000.
--
-- Expected columns:
-- currency
-- average_amount
-- ============================================================

SELECT currency,
       AVG(amount) AS average_amount
FROM transactions
GROUP BY currency
HAVING AVG(amount) > 5000;


-- ============================================================
-- TASK 7
-- For each transaction type, calculate:
-- - number of transactions
-- - total transaction value
--
-- Expected columns:
-- transaction_type
-- transaction_count
-- total_amount
-- ============================================================

SELECT transaction_type,
       COUNT(transaction_id) AS transaction_count,
       SUM(amount) AS total_amount
FROM transactions
GROUP BY transaction_type;


-- ============================================================
-- TASK 8
-- Show only transaction types that occur at least 5 times.
--
-- Expected columns:
-- transaction_type
-- transaction_count
-- ============================================================

SELECT transaction_type,
       COUNT(transaction_id) AS transaction_count
FROM transactions
GROUP BY transaction_type
HAVING COUNT(transaction_id) >= 5;


-- ============================================================
-- TASK 9
-- For each status, count the number of transactions.
-- Show only statuses with at least 2 transactions.
--
-- Expected columns:
-- status
-- transaction_count
-- ============================================================

SELECT status,
       COUNT(transaction_id) AS transaction_count
FROM transactions
GROUP BY status
HAVING COUNT(transaction_id) >= 2;


-- ============================================================
-- TASK 10 - CHALLENGE
-- For each country, calculate:
-- - number of transactions
-- - total transaction value
-- - average transaction amount
--
-- Show only countries where the total transaction value
-- is greater than 15,000.
--
-- Expected columns:
-- country
-- transaction_count
-- total_amount
-- average_amount
-- ============================================================

SELECT country,
       COUNT(transaction_id) AS transaction_count,
       SUM(amount) AS total_amount,
       AVG(amount) AS average_amount
FROM transactions
GROUP BY country
HAVING SUM(amount) > 15000;


-- ============================================================
-- REVIEW - LESSON 11
-- ============================================================


-- REVIEW 1
-- Count Completed transactions for each country.
--
-- Use:
-- WHERE
-- GROUP BY
-- COUNT()
-- ============================================================

SELECT country,
       COUNT(transaction_id) AS transaction_count
FROM transactions
WHERE status = 'Completed'
GROUP BY country;


-- REVIEW 2
-- Show countries where the total value of Completed
-- transactions is greater than 10,000.
--
-- Use:
-- WHERE
-- GROUP BY
-- SUM()
-- HAVING
-- ============================================================

SELECT country,
       SUM(amount) AS total_amount
FROM transactions
WHERE status = 'Completed'
GROUP BY country
HAVING SUM(amount) > 10000;


-- REVIEW 3 - FINAL
-- For each transaction type, calculate:
-- - number of Completed transactions
-- - total value of Completed transactions
-- Show only transaction types with total value
-- greater than 10,000.
--
-- Use:
-- WHERE
-- GROUP BY
-- COUNT()
-- SUM()
-- HAVING
-- ============================================================

SELECT transaction_type,
       COUNT(transaction_id) AS transaction_count,
       SUM(amount) AS total_amount
FROM transactions
WHERE status = 'Completed'
GROUP BY transaction_type
HAVING SUM(amount) > 10000;
