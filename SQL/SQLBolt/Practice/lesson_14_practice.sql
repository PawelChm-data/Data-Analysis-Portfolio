-- ============================================================
-- SQLBolt Lesson 14 - Practice
-- Topic: UPDATE
-- ============================================================


-- ============================================================
-- TASKS
-- ============================================================

-- TASK 1
-- Update the country of customer 506.
--
-- customer_id: 506
-- new country: DE


-- TASK 2
-- Update the status of all completed Card Payment transactions.
--
-- transaction_type: Card Payment
-- current status: Completed
-- new status: Reviewed


-- TASK 3
-- Update two columns of customer 507.
--
-- customer_id: 507
-- new customer_type: Individual
-- new country: PL


-- TASK 4
-- Increase the amount of all EUR transactions by 5%.
--
-- Use a mathematical expression in SET.
-- Example:
-- 1000 EUR -> 1050 EUR


-- TASK 5
-- Update the status of all transactions that meet ALL
-- of the following conditions:
--
-- country: DE
-- amount: greater than 10000
-- current status: Completed
--
-- New status: Reviewed


-- ============================================================
-- SOLUTIONS
-- ============================================================

-- TASK 1

UPDATE customers
SET country = 'DE'
WHERE customer_id = 506;


-- TASK 2

UPDATE transactions
SET status = 'Reviewed'
WHERE transaction_type = 'Card Payment'
AND status = 'Completed';


-- TASK 3

UPDATE customers
SET customer_type = 'Individual',
    country = 'PL'
WHERE customer_id = 507;


-- TASK 4

UPDATE transactions
SET amount = amount * 1.05
WHERE currency = 'EUR';


-- TASK 5

UPDATE transactions
SET status = 'Reviewed'
WHERE country = 'DE'
AND amount > 10000
AND status = 'Completed';
