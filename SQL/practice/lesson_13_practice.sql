-- ============================================================
-- SQLBolt Lesson 13 - Practice
-- Topic: INSERT INTO
-- ============================================================

-- TASK 1
-- Insert a new customer into the customers table.
--------------------------------------------------

-- customer_id: 506
-- customer_name: Michael Brown
-- customer_type: Individual
-- country: PL

-- TASK 2
-- Insert a new customer into the customers table.
-- Use an explicit column list.
-------------------------------

-- customer_id: 507
-- customer_name: Anna Kowalska
-- customer_type: Business
-- country: DE

-- TASK 3
-- Insert a new transaction into the transactions table.
--------------------------------------------------------

-- transaction_id: 1016
-- customer_id: 506
-- amount: 7500
-- currency: EUR
-- country: PL
-- transaction_type: Transfer
-- status: Completed

-- TASK 4
-- Insert a new transaction into the transactions table.
--------------------------------------------------------

-- transaction_id: 1017
-- customer_id: 507
-- amount: 12500
-- currency: EUR
-- country: DE
-- transaction_type: Transfer
-- status: Completed

-- TASK 5
-- Insert three new customers using a single INSERT statement.
--------------------------------------------------------------

-- 508 | Robert Miller | Individual | US
-- 509 | Sarah Wilson  | Business   | NL
-- 510 | Thomas Evans  | Individual | DE

-- TASK 6
-- Insert two new transactions using a single INSERT statement.
---------------------------------------------------------------

-- 1018 | 508 | 4500 | USD | US | Card Payment | Completed
-- 1019 | 509 | 9200 | EUR | NL | Transfer     | Completed

-- TASK 7
-- Insert a new transaction.
-- Use a mathematical expression to calculate the amount.
---------------------------------------------------------

-- transaction_id: 1020
-- customer_id: 510
-- amount: 5000 * 1.1
-- currency: EUR
-- country: DE
-- transaction_type: Transfer
-- status: Completed

-- TASK 8
-- Insert two new Business customers using a single INSERT statement.
-- Use an explicit column list.
-------------------------------

-- 511 | James Anderson | Business | PL
-- 512 | Emma Taylor    | Business | NL

-- ============================================================
-- SOLUTIONS
-- ============================================================

-- TASK 1

INSERT INTO customers
VALUES (506, 'Michael Brown', 'Individual', 'PL');

-- TASK 2

INSERT INTO customers
(customer_id, customer_name, customer_type, country)
VALUES (507, 'Anna Kowalska', 'Business', 'DE');

-- TASK 3

INSERT INTO transactions
VALUES (1016, 506, 7500, 'EUR', 'PL', 'Transfer', 'Completed');

-- TASK 4

INSERT INTO transactions
VALUES (1017, 507, 12500, 'EUR', 'DE', 'Transfer', 'Completed');

-- TASK 5

INSERT INTO customers
(customer_id, customer_name, customer_type, country)
VALUES
(508, 'Robert Miller', 'Individual', 'US'),
(509, 'Sarah Wilson', 'Business', 'NL'),
(510, 'Thomas Evans', 'Individual', 'DE');

-- TASK 6

INSERT INTO transactions
(transaction_id, customer_id, amount, currency, country, transaction_type, status)
VALUES
(1018, 508, 4500, 'USD', 'US', 'Card Payment', 'Completed'),
(1019, 509, 9200, 'EUR', 'NL', 'Transfer', 'Completed');

-- TASK 7

INSERT INTO transactions
(transaction_id, customer_id, amount, currency, country, transaction_type, status)
VALUES
(1020, 510, 5000 * 1.1, 'EUR', 'DE', 'Transfer', 'Completed');

-- TASK 8

INSERT INTO customers
(customer_id, customer_name, customer_type, country)
VALUES
(511, 'James Anderson', 'Business', 'PL'),
(512, 'Emma Taylor', 'Business', 'NL');
