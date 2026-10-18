-- ============================================================
-- SQLBolt Lesson 18 - Practice
-- Topic: DROP TABLE
-- ============================================================

-- ============================================================
-- TASKS
-- ============================================================

-- TASK 1
-- Remove the "accounts" table from the database.


-- TASK 2
-- Remove the "employees" table from the database.


-- TASK 3
-- Remove the "merchants" table from the database.
-- Use IF EXISTS.


-- TASK 4
-- Remove the "loans" table from the database.
-- Use IF EXISTS.


-- TASK 5
-- Remove the "payments" table from the database.


-- TASK 6
-- Safely remove the "transaction_history" table.
-- Use IF EXISTS.


-- ============================================================
-- SOLUTIONS
-- ============================================================

-- TASK 1

DROP TABLE IF EXISTS accounts;


-- TASK 2

DROP TABLE IF EXISTS employees;


-- TASK 3

DROP TABLE IF EXISTS merchants;


-- TASK 4

DROP TABLE IF EXISTS loans;


-- TASK 5

DROP TABLE IF EXISTS payments;


-- TASK 6

DROP TABLE IF EXISTS transaction_history;
