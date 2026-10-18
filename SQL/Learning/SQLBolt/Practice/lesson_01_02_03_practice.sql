/*
SQL Fundamentals - Practice

Topics covered:
- SELECT
- WHERE
- Comparison operators
- AND / OR
- IN / NOT IN
- BETWEEN
- LIKE / NOT LIKE
- Wildcards: % and _

Dataset:
Synthetic transaction data created for educational purposes.

This file contains practical exercises completed during my
SQL learning journey.
*/


-- ============================================================
-- SECTION 1: BASIC FILTERING
-- ============================================================

-- Task 1
-- Find transactions with an amount between 1,000 and 10,000.

SELECT *
FROM transactions
WHERE amount BETWEEN 1000 AND 10000;


-- Task 2
-- Find transactions made in Poland, Germany or the Netherlands.

SELECT *
FROM transactions
WHERE country IN ('PL', 'DE', 'NL');


-- Task 3
-- Find card payments below 1,000.

SELECT *
FROM transactions
WHERE amount < 1000
  AND transaction_type = 'Card Payment';


-- Task 4
-- Find transactions with Pending, Failed or Declined status.

SELECT *
FROM transactions
WHERE status IN ('Pending', 'Failed', 'Declined');


-- ============================================================
-- SECTION 2: AND / OR
-- ============================================================

-- Task 5
-- Find transactions above 10,000 made in Germany or the US.

SELECT *
FROM transactions
WHERE amount > 10000
  AND country IN ('DE', 'US');


-- Task 6
-- Find transactions belonging to customer 503
-- that are either above 10,000 or have Pending status.

SELECT *
FROM transactions
WHERE customer_id = 503
  AND (amount > 10000 OR status = 'Pending');


-- Task 7
-- Find transactions of at least 8,000,
-- made in Germany or the Netherlands,
-- with Completed status.

SELECT *
FROM transactions
WHERE amount >= 8000
  AND country IN ('DE', 'NL')
  AND status = 'Completed';


-- ============================================================
-- SECTION 3: FINANCIAL TRANSACTION ANALYSIS
-- ============================================================

-- Task 8
-- Find transactions of at least 10,000,
-- made outside Poland,
-- and performed as Transfers.

SELECT *
FROM transactions
WHERE amount >= 10000
  AND country != 'PL'
  AND transaction_type = 'Transfer';


-- Task 9
-- Find EUR transactions between 8,000 and 10,000,
-- made in Germany or the Netherlands,
-- and performed as Transfers.

SELECT *
FROM transactions
WHERE amount BETWEEN 8000 AND 10000
  AND currency = 'EUR'
  AND country IN ('DE', 'NL')
  AND transaction_type = 'Transfer';


-- ============================================================
-- SECTION 4: CUSTOMER ANALYSIS
-- ============================================================

-- Task 10
-- Find completed EUR transactions belonging to customer 502,
-- above 8,000,
-- made in Germany or the Netherlands.

SELECT *
FROM transactions
WHERE customer_id = 502
  AND amount > 8000
  AND currency = 'EUR'
  AND country IN ('DE', 'NL')
  AND status = 'Completed';


-- ============================================================
-- SECTION 5: LIKE / NOT LIKE
-- ============================================================

-- Task 11
-- Find transactions where transaction_type contains "Payment".

SELECT *
FROM transactions
WHERE transaction_type LIKE '%Payment%';


-- Task 12
-- Find transactions where transaction_type does not contain "Payment".

SELECT *
FROM transactions
WHERE transaction_type NOT LIKE '%Payment%';


-- Task 13
-- Find transactions where the status starts with "Com".

SELECT *
FROM transactions
WHERE status LIKE 'Com%';


-- Task 14
-- Find transactions where transaction_type ends with "ment".

SELECT *
FROM transactions
WHERE transaction_type LIKE '%ment';


-- ============================================================
-- SECTION 6: WILDCARDS
-- ============================================================

-- Task 15
-- Find transaction types that start with "T".

SELECT *
FROM transactions
WHERE transaction_type LIKE 'T%';


-- Task 16
-- Find transaction types that end with "ment".

SELECT *
FROM transactions
WHERE transaction_type LIKE '%ment';


-- Task 17
-- Find transaction types containing "ans".

SELECT *
FROM transactions
WHERE transaction_type LIKE '%ans%';


-- Task 18
-- Find transactions where the status does not start with "C".

SELECT *
FROM transactions
WHERE status NOT LIKE 'C%';


-- Task 19
-- Find transactions where the country code consists
-- of exactly two characters.

SELECT *
FROM transactions
WHERE country LIKE '__';


-- ============================================================
-- SECTION 7: TRANSACTION MONITORING ANALYSIS
-- ============================================================

-- Task 20
-- Identify completed transfers above 8,000
-- made outside Poland.

SELECT *
FROM transactions
WHERE transaction_type = 'Transfer'
  AND status = 'Completed'
  AND country != 'PL'
  AND amount > 8000;


/*
TM ANALYTICAL NOTE

A transaction matching a specific rule does not automatically
mean that suspicious activity or financial crime has occurred.

Further analysis may require:

- customer profile
- expected account activity
- Source of Funds
- Source of Wealth
- transaction purpose
- counterparties
- transaction frequency
- historical activity
- geographic rationale

The objective of transaction monitoring analysis is to identify
activity that may warrant further investigation.
*/
