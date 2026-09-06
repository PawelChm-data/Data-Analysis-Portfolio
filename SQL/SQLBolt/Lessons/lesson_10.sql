-- SQL Fundamentals at SQLBolt
-- Lesson: 10
-- Dataset: https://sqlbolt.com/lesson/select_queries_with_aggregates

-- Task 1
SELECT name, max(Years_employed) FROM employees;

-- Task 2
select distinct Role, avg(Years_employed) from Employees
group by Role;

-- Task 3
select Building, sum(Years_employed) from Employees
group by Building;
