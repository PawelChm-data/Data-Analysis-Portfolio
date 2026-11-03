# SQLBolt – SQL Fundamentals and Practice

## Overview

This folder contains my SQL learning notes and practice exercises based on the
18 interactive lessons available on [SQLBolt](https://sqlbolt.com/).

The repository is organized into two parts:

- **Lessons** – SQL queries written while working through the SQLBolt lessons.
- **Practice** – additional exercises created to reinforce the concepts from
  individual lessons and review multiple topics together.

The goal is to build a practical foundation in SQL, from basic data retrieval
and filtering to joins, aggregation, data modification, and table management.

## Repository Structure

```text
SQLBolt/
├── Datasets/
│   ├── customers.csv
│   └── transactions.csv
├── Lessons/
│   ├── lesson_01.sql
│   ├── lesson_02.sql
│   ├── ...
│   └── lesson_18.sql
├── Practice/
│   ├── lessons_01_08_review.sql
│   ├── lesson_01_02_03_practice.sql
│   ├── lesson_04_practice.sql
│   ├── ...
│   └── lesson_18_practice.sql
└── README.md
```

## Lessons

| Lesson | Main topics |
|---|---|
| 01 | `SELECT` – retrieving columns from a table |
| 02 | `WHERE` – filtering rows using conditions |
| 03 | Filtering with additional operators and pattern matching (`LIKE`) |
| 04 | `DISTINCT`, sorting with `ORDER BY`, limiting results |
| 05 | Review of basic queries and filtering |
| 06 | `INNER JOIN` – combining related tables |
| 07 | `LEFT JOIN` and `RIGHT JOIN` – outer joins |
| 08 | Handling missing values with `NULL`, `IS NULL`, and `IS NOT NULL` |
| 09 | Expressions and calculations in query results |
| 10 | Aggregate functions such as `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX` |
| 11 | Grouping and filtering aggregated results with `GROUP BY` and `HAVING` |
| 12 | SQL query order of execution |
| 13 | Inserting rows with `INSERT INTO` |
| 14 | Modifying existing data with `UPDATE` |
| 15 | Removing rows with `DELETE` |
| 16 | Creating tables with `CREATE TABLE` |
| 17 | Modifying table structures with `ALTER TABLE` |
| 18 | Removing tables with `DROP TABLE` |

## Practice Exercises

The `Practice` folder contains additional exercises aligned with the lessons.
It includes focused practice, cumulative reviews, and exercises with worked
solutions in the later lessons.

| File | Focus |
|---|---|
| `lessons_01_08_review.sql` | Consolidated review of foundational SQL concepts |
| `lesson_01_02_03_practice.sql` | `SELECT`, `WHERE`, comparison and pattern-matching conditions |
| `lesson_04_practice.sql` | `DISTINCT`, `ORDER BY`, and limiting results |
| `lesson_05_practice.sql` | Review of querying and filtering |
| `lesson_06_practice.sql` | `INNER JOIN` |
| `lesson_07_practice.sql` | Outer joins and unmatched rows |
| `lesson_08_practice.sql` | `NULL` handling |
| `lesson_09_practice.sql` | Expressions and calculated columns |
| `lesson_10_practice.sql` | Aggregate functions |
| `lesson_11_practice.sql` | `GROUP BY` and `HAVING` |
| `lesson_12_practice.sql` | Query execution order and combined query concepts |
| `lesson_13_practice.sql` | `INSERT INTO` |
| `lesson_14_practice.sql` | `UPDATE` |
| `lesson_15_practice.sql` | `DELETE` |
| `lesson_16_practice.sql` | `CREATE TABLE` and constraints |
| `lesson_17_practice.sql` | `ALTER TABLE` |
| `lesson_18_practice.sql` | `DROP TABLE` |

Some practice files use a small custom **transactions and customers** dataset.
The exercises cover customer and transaction attributes such as customer type,
country, transaction amount, currency, transaction type, and status. Earlier
lesson scripts use the example tables from SQLBolt, including movies,
box-office data, employees, buildings, and cities.

## Skills Covered

- Selecting and filtering data
- Sorting and removing duplicate results
- Combining tables with joins
- Working with `NULL` values
- Creating calculated columns and expressions
- Using aggregate functions
- Grouping data and filtering groups
- Understanding SQL query execution order
- Inserting, updating, and deleting records
- Creating, altering, and dropping database tables
- Applying basic table constraints

## How to Use

1. Open a `.sql` file in a SQL editor or database environment compatible with
   the syntax used in the exercise.
2. Review the task comments before running the query.
3. Attempt the exercise independently before checking any provided solution.
4. For `INSERT`, `UPDATE`, and `DELETE` exercises, use a test database or reset
   the sample data between attempts when necessary.

## SQL Dialect and Compatibility

The lesson scripts follow the SQL syntax and examples used by SQLBolt.
Some statements and data types are SQLite-oriented (for example, `LIMIT`,
`TEXT`, and SQLite-style `ALTER TABLE` syntax). They may require adjustments
when executed in Microsoft SQL Server / T-SQL.

The practice files also contain exercises that modify data or database
structures. Run them in a dedicated test environment, not against production
data.

## Learning Resource and Attribution

The original lesson sequence and interactive exercises are provided by
[SQLBolt](https://sqlbolt.com/). This repository contains my learning scripts
and supplementary practice work.

The custom transactions and customers exercises are intended for educational
SQL practice. Any third-party learning materials and datasets remain subject
to their respective terms and ownership.
