-- ============================================================
-- SQLBolt Lesson 17 - Practice
-- Topic: ALTER TABLE
-- ============================================================

-- ============================================================
-- TASKS
-- ============================================================

-- TASK 1
-- Add a new column "email" of type TEXT to the customers table.


-- TASK 2
-- Add a new column "status" of type TEXT to the customers table.
-- The default value should be 'Active'.


-- TASK 3
-- Add a new column "risk_score" of type INTEGER to the transactions table.


-- TASK 4
-- Add two new columns to the transactions table:
-- 1. reviewed_by - TEXT
-- 2. review_status - TEXT with default value 'Pending'
-- Use separate ALTER TABLE statements.


-- TASK 5
-- Remove the "email" column from the customers table.


-- TASK 6
-- Rename the transactions table to "transaction_history".


-- ============================================================
-- SOLUTIONS
-- ============================================================

-- TASK 1

ALTER TABLE customers
ADD COLUMN email TEXT;


-- TASK 2

ALTER TABLE customers
ADD COLUMN status TEXT DEFAULT 'Active';


-- TASK 3

ALTER TABLE transactions
ADD COLUMN risk_score INTEGER;


-- TASK 4

ALTER TABLE transactions
ADD COLUMN reviewed_by TEXT;

ALTER TABLE transactions
ADD COLUMN review_status TEXT DEFAULT 'Pending';


-- TASK 5

ALTER TABLE customers
DROP COLUMN email;


-- TASK 6

ALTER TABLE transactions
RENAME TO transaction_history;
