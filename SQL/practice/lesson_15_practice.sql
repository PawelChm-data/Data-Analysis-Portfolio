-- ============================================================
-- SQLBolt Lesson 15 - Practice
-- Topic: DELETE
-- ============================================================


-- ============================================================
-- TASKS
-- ============================================================

-- TASK 1
-- Delete the transaction with transaction_id = 1020.


-- TASK 2
-- Delete all transactions with the status 'Declined'.


-- TASK 3
-- Delete the customer with customer_id = 512.


-- TASK 4
-- Delete all transactions that meet ALL of the following
-- conditions:
--
-- currency: USD
-- amount: less than 5000
-- status: Completed


-- TASK 5
-- Delete all transactions belonging to customer_id = 509.


-- ============================================================
-- SOLUTIONS
-- ============================================================

-- TASK 1

DELETE FROM transactions
WHERE transaction_id = 1020;


-- TASK 2

DELETE FROM transactions
WHERE status = 'Declined';


-- TASK 3

DELETE FROM customers
WHERE customer_id = 512;


-- TASK 4

DELETE FROM transactions
WHERE currency = 'USD'
AND amount < 5000
AND status = 'Completed';


-- TASK 5

DELETE FROM transactions
WHERE customer_id = 509;
