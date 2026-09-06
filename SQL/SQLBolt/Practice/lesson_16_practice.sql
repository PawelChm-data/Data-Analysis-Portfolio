-- ============================================================
-- SQLBolt Lesson 16 - Practice
-- Topic: CREATE TABLE & Constraints
-- ============================================================


-- ============================================================
-- TASKS
-- ============================================================

-- TASK 1
-- Create a table named users.
--
-- Columns:
-- user_id     - INTEGER, PRIMARY KEY
-- username    - TEXT, NOT NULL
-- email       - TEXT
-- country     - TEXT


-- TASK 2
-- Create a table named cards.
--
-- Columns:
-- card_id      - INTEGER, PRIMARY KEY
-- card_number  - TEXT, UNIQUE
-- card_type    - TEXT
-- country     - TEXT


-- TASK 3
-- Create a table named accounts.
--
-- Columns:
-- account_id   - INTEGER, PRIMARY KEY
-- customer_id  - INTEGER, NOT NULL
-- balance      - FLOAT
-- currency     - TEXT
--
-- Add a CHECK constraint requiring balance to be
-- greater than or equal to 0.


-- TASK 4
-- Create a table named merchants.
--
-- Columns:
-- merchant_id    - INTEGER, PRIMARY KEY
-- merchant_name  - TEXT, NOT NULL
-- merchant_code  - TEXT, UNIQUE
-- country        - TEXT, NOT NULL
-- risk_score     - INTEGER
--
-- Add a CHECK constraint requiring risk_score to be
-- between 0 and 100, inclusive.


-- TASK 5
-- Create a table named transactions_log.
--
-- Columns:
-- log_id          - INTEGER, PRIMARY KEY
-- transaction_id  - INTEGER, NOT NULL
-- amount          - FLOAT
-- currency        - TEXT, NOT NULL
-- reference       - TEXT, UNIQUE
-- risk_score      - INTEGER
-- status          - TEXT
--
-- Add a CHECK constraint requiring:
-- amount to be greater than 0
-- risk_score to be between 0 and 100, inclusive


-- ============================================================
-- SOLUTIONS
-- ============================================================

-- TASK 1

CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    username TEXT NOT NULL,
    email TEXT,
    country TEXT
);


-- TASK 2

CREATE TABLE cards (
    card_id INTEGER PRIMARY KEY,
    card_number TEXT UNIQUE,
    card_type TEXT,
    country TEXT
);


-- TASK 3

CREATE TABLE accounts (
    account_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    balance FLOAT CHECK (balance >= 0),
    currency TEXT
);


-- TASK 4

CREATE TABLE merchants (
    merchant_id INTEGER PRIMARY KEY,
    merchant_name TEXT NOT NULL,
    merchant_code TEXT UNIQUE,
    country TEXT NOT NULL,
    risk_score INTEGER CHECK (risk_score >= 0 AND risk_score <= 100)
);


-- TASK 5

CREATE TABLE transactions_log (
    log_id INTEGER PRIMARY KEY,
    transaction_id INTEGER NOT NULL,
    amount FLOAT CHECK (amount > 0),
    currency TEXT NOT NULL,
    reference TEXT UNIQUE,
    risk_score INTEGER CHECK (risk_score >= 0 AND risk_score <= 100),
    status TEXT
);
