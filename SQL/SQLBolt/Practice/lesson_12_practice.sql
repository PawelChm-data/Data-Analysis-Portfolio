-- SQL Lesson 12 Practice
-- Topic: Order of Execution
-- Review of SQLBolt Lessons 1-12
-- Dataset: transactions + customers


-- ============================================================
-- TASKS
-- ============================================================

-- 1. WHERE + ORDER BY
-- Find transaction_id, amount and currency for transactions
-- above 5000 EUR.
-- Sort by amount from highest to lowest.


-- 2. JOIN + WHERE
-- Display:
-- customer_name
-- customer_type
-- transaction_id
-- amount
--
-- for Completed transactions made by Business customers.


-- 3. JOIN + GROUP BY
-- For each customer_type, count the total number
-- of transactions.
--
-- Display:
-- customer_type
-- transaction_count


-- 4. GROUP BY + HAVING + ORDER BY
-- For each transaction_type calculate:
-- - number of transactions
-- - total transaction amount
--
-- Show only transaction types where the total amount
-- is greater than 15000.
-- Sort by total amount from highest to lowest.


-- 5. JOIN + WHERE + GROUP BY + HAVING
-- For each customer_type count Completed transactions.
-- Show only customer types with more than 2 Completed transactions.


-- 6. SELECT expression + alias + ORDER BY
-- Display:
-- transaction_id
-- amount
-- amount * 1.02 AS amount_with_fee
--
-- Sort by amount_with_fee from highest to lowest.


-- 7. JOIN + WHERE + ORDER BY + LIMIT
-- Find the 5 largest Completed transactions
-- made by Business customers.
--
-- Display:
-- customer_name
-- customer_type
-- transaction_id
-- amount
--
-- Sort by amount from highest to lowest.


-- 8. GROUP BY + HAVING + ORDER BY + LIMIT
-- For each country calculate:
-- - number of transactions
-- - average transaction amount
--
-- Show only countries where the average amount
-- is greater than 5000.
-- Sort by average amount from highest to lowest.
-- Return only the top 3 countries.


-- 9. JOIN + WHERE
-- Display customer_name, customer_type, transaction_id and amount
-- for all Completed transactions made by Business customers.


-- 10. JOIN + WHERE + ORDER BY
-- Display customer_name, transaction_id, transaction_type,
-- amount and currency for Transfer transactions above 8000.
-- Sort by amount from highest to lowest.


-- 11. JOIN + GROUP BY
-- For each customer_type, count the total number of transactions.
-- Display customer_type and transaction_count.


-- 12. JOIN + WHERE + GROUP BY + HAVING
-- For each customer_type, count Completed transactions.
-- Display only customer types with more than 2 Completed transactions.


-- 13. JOIN + GROUP BY + HAVING + ORDER BY
-- For each customer, display:
-- customer_name
-- transaction_count
-- average transaction amount
-- Display only customers with more than 2 transactions.
-- Sort by average transaction amount from highest to lowest.


-- ============================================================
-- SOLUTIONS
-- ============================================================


-- 1. WHERE + ORDER BY

SELECT transaction_id,
       amount,
       currency
FROM transactions
WHERE currency = 'EUR'
  AND amount > 5000
ORDER BY amount DESC;


-- 2. JOIN + WHERE

SELECT c.customer_name,
       c.customer_type,
       t.transaction_id,
       t.amount
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
WHERE t.status = 'Completed'
  AND c.customer_type = 'Business';


-- 3. JOIN + GROUP BY

SELECT c.customer_type,
       COUNT(t.transaction_id) AS transaction_count
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
GROUP BY c.customer_type;


-- 4. GROUP BY + HAVING + ORDER BY

SELECT t.transaction_type,
       COUNT(t.transaction_id) AS total_transactions,
       SUM(t.amount) AS total_amount
FROM transactions AS t
GROUP BY t.transaction_type
HAVING SUM(t.amount) > 15000
ORDER BY total_amount DESC;


-- 5. JOIN + WHERE + GROUP BY + HAVING

SELECT c.customer_type,
       COUNT(t.transaction_id) AS transaction_count
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
WHERE t.status = 'Completed'
GROUP BY c.customer_type
HAVING COUNT(t.transaction_id) > 2;


-- 6. SELECT expression + alias + ORDER BY

SELECT transaction_id,
       amount,
       amount * 1.02 AS amount_with_fee
FROM transactions
ORDER BY amount_with_fee DESC;


-- 7. JOIN + WHERE + ORDER BY + LIMIT

SELECT c.customer_name,
       c.customer_type,
       t.transaction_id,
       t.amount
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
WHERE t.status = 'Completed'
  AND c.customer_type = 'Business'
ORDER BY t.amount DESC
LIMIT 5;


-- 8. GROUP BY + HAVING + ORDER BY + LIMIT

SELECT country,
       COUNT(transaction_id) AS total_transactions,
       AVG(amount) AS avg_amount
FROM transactions
GROUP BY country
HAVING AVG(amount) > 5000
ORDER BY avg_amount DESC
LIMIT 3;


-- 9. JOIN + WHERE

SELECT c.customer_name,
       c.customer_type,
       t.transaction_id,
       t.amount
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
WHERE t.status = 'Completed'
  AND c.customer_type = 'Business';


-- 10. JOIN + WHERE + ORDER BY

SELECT c.customer_name,
       t.transaction_id,
       t.transaction_type,
       t.amount,
       t.currency
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
WHERE t.transaction_type = 'Transfer'
  AND t.amount > 8000
ORDER BY t.amount DESC;


-- 11. JOIN + GROUP BY

SELECT c.customer_type,
       COUNT(t.transaction_id) AS transaction_count
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
GROUP BY c.customer_type;


-- 12. JOIN + WHERE + GROUP BY + HAVING

SELECT c.customer_type,
       COUNT(t.transaction_id) AS transaction_count
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
WHERE t.status = 'Completed'
GROUP BY c.customer_type
HAVING COUNT(t.transaction_id) > 2;


-- 13. JOIN + GROUP BY + HAVING + ORDER BY

SELECT c.customer_name,
       COUNT(t.transaction_id) AS transaction_count,
       AVG(t.amount) AS avg_amount
FROM customers AS c
INNER JOIN transactions AS t
    ON c.customer_id = t.customer_id
GROUP BY c.customer_name
HAVING COUNT(t.transaction_id) > 2
ORDER BY avg_amount DESC;

-- ============================================================
-- LESSON 12 - KEY CONCEPT
-- ============================================================

-- Logical order of SQL query execution:
--
-- 1. FROM
-- 2. JOIN
-- 3. ON
-- 4. WHERE
-- 5. GROUP BY
-- 6. HAVING
-- 7. SELECT
-- 8. ORDER BY
-- 9. LIMIT / OFFSET
--
-- WHERE filters individual rows.
-- GROUP BY creates groups.
-- HAVING filters grouped results.
-- SELECT creates the final output.
-- ORDER BY sorts the result.
-- LIMIT / OFFSET restricts the final result.
