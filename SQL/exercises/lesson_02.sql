-- SQL Fundamentals at SQLBolt
-- Lessons 2
-- Datset: https://sqlbolt.com/lesson/select_queries_with_constraints

-- Task 1
SELECT * FROM movies WHERE id = 6;

-- Task 2
SELECT * FROM movies WHERE Year between 2000 and 2010;

-- Task 3
SELECT * FROM Movies WHERE Year not between 2000 and 2010;

-- Task 4
SELECT * FROM Movies WHERE id between 1 and 5;
