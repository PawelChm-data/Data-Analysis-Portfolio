-- ============================================================
-- SQL Practice - Lesson 09: Expressions
-- Based on SQLBolt Lesson 9
-- Dataset: transactions + customers
-- ============================================================


-- ============================================================
-- TASK 1
-- Display transaction_id and calculate amount / 2.
-- Alias the result as amount_eur.
-- ============================================================

SELECT transaction_id,
       amount / 2 AS amount_eur
FROM transactions;


-- ============================================================
-- TASK 2
-- Calculate the transaction amount including a 2% fee.
-- Display transaction_id and amount_with_fee.
-- ============================================================

SELECT transaction_id,
       amount * 1.02 AS amount_with_fee
FROM transactions;


-- ============================================================
-- TASK 3
-- Calculate the transaction amount after deducting a 2% fee.
-- Display transaction_id and amount_after_fee.
-- ============================================================

SELECT transaction_id,
       amount * 0.98 AS amount_after_fee
FROM transactions;


-- ============================================================
-- TASK 4
-- Find transactions whose value after adding 10% exceeds 10,000.
-- Display transaction_id, amount and amount_with_10_percent.
-- ============================================================

SELECT transaction_id,
       amount,
       amount * 1.1 AS amount_with_10_percent
FROM transactions
WHERE amount * 1.1 > 10000;


-- ============================================================
-- TASK 5
-- Convert transaction amounts into thousands.
-- Display transaction_id and amount_thousands.
-- ============================================================

SELECT transaction_id,
       amount / 1000 AS amount_thousands
FROM transactions;


-- ============================================================
-- TASK 6
-- Rename columns using aliases:
-- customer_id → customer
-- transaction_id → transaction
-- amount → transaction_value
-- ============================================================

SELECT customer_id AS customer,
       transaction_id AS transaction,
       amount AS transaction_value
FROM transactions;


-- ============================================================
-- TASK 7
-- Find transactions whose value after a 5% increase
-- exceeds 10,000.
-- Display transaction_id and amount_after_increase.
-- ============================================================

SELECT transaction_id,
       amount * 1.05 AS amount_after_increase
FROM transactions
WHERE amount * 1.05 > 10000;


-- ============================================================
-- TASK 8
-- Convert transaction amounts into thousands and sort
-- from the highest value to the lowest.
-- ============================================================

SELECT transaction_id,
       amount / 1000 AS amount_thousands
FROM transactions
ORDER BY amount_thousands DESC;


-- ============================================================
-- TASK 9
-- Join customers and transactions using table aliases.
-- customers → c
-- transactions → t
--
-- Display customer_name, transaction_id and amount.
-- ============================================================

SELECT c.customer_name,
       t.transaction_id,
       t.amount
FROM transactions AS t
INNER JOIN customers AS c
    ON t.customer_id = c.customer_id;


-- ============================================================
-- TASK 10
-- Join customers and transactions.
-- Display customer information, transaction information
-- and calculate the transaction amount including a 2% fee.
-- Sort by amount_with_fee descending.
-- ============================================================

SELECT c.customer_name,
       c.customer_type,
       t.transaction_id,
       t.amount,
       t.amount * 1.02 AS amount_with_fee
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
ORDER BY amount_with_fee DESC;


-- ============================================================
-- TASK 11
-- Find Completed Transfers worth at least 8,000.
-- Display customer_name, transaction_id, amount, currency,
-- country and amount_after_fee.
--
-- Assume a 2% fee.
-- ============================================================

SELECT c.customer_name,
       t.transaction_id,
       t.amount,
       t.currency,
       t.country,
       t.amount * 0.98 AS amount_after_fee
FROM transactions AS t
INNER JOIN customers AS c
    ON t.customer_id = c.customer_id
WHERE t.transaction_type = 'Transfer'
  AND t.status = 'Completed'
  AND t.amount >= 8000
ORDER BY amount_after_fee DESC;


-- ============================================================
-- TASK 12 - CHALLENGE
-- Find EUR transactions above 5,000.
-- Display transaction_id, customer_name, amount
-- and amount_in_cents.
--
-- Use table aliases:
-- customers → c
-- transactions → t
-- ============================================================

SELECT t.transaction_id,
       c.customer_name,
       t.amount,
       t.amount * 100 AS amount_in_cents
FROM transactions AS t
INNER JOIN customers AS c
    ON t.customer_id = c.customer_id
WHERE t.currency = 'EUR'
  AND t.amount > 5000;


-- ============================================================
-- MINI PRACTICE - LESSON 9
-- ============================================================

-- MINI TASK 1
-- Find transactions whose value after adding 10%
-- exceeds 10,000.

SELECT transaction_id,
       amount,
       amount * 1.1 AS amount_with_10_percent
FROM transactions
WHERE amount * 1.1 > 10000;


-- MINI TASK 2
-- Calculate amount after a 2% fee
-- and sort from highest to lowest.

SELECT transaction_id,
       amount,
       amount * 0.98 AS amount_after_fee
FROM transactions
ORDER BY amount_after_fee DESC;


-- MINI TASK 3
-- Join customers and transactions using aliases.
-- Display customer_name, customer_type,
-- transaction_id and amount.

SELECT c.customer_name,
       c.customer_type,
       t.transaction_id,
       t.amount
FROM transactions AS t
INNER JOIN customers AS c
    ON c.customer_id = t.customer_id;


-- MINI TASK 4
-- Find EUR Completed Transfers above 5,000.
-- Use table aliases.

SELECT c.customer_name,
       t.transaction_id,
       t.amount,
       t.currency
FROM transactions AS t
INNER JOIN customers AS c
    ON c.customer_id = t.customer_id
WHERE t.currency = 'EUR'
  AND t.amount > 5000
  AND t.transaction_type = 'Transfer'
  AND t.status = 'Completed';


-- MINI TASK 5 - FINAL
-- Find Completed Transfers worth at least 8,000.
-- Calculate a 2% fee and sort by the final amount.

SELECT c.customer_name,
       c.customer_type,
       t.transaction_id,
       t.amount,
       t.amount * 1.02 AS amount_with_fee
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
WHERE t.transaction_type = 'Transfer'
  AND t.status = 'Completed'
  AND t.amount >= 8000
ORDER BY amount_with_fee DESC;
