-- SQL Fundamentals at SQLBolt
-- Lesson: 11
-- Dataset: https://sqlbolt.com/lesson/select_queries_with_aggregates_pt_2

-- Task 1
select Role, count(Role) as Artists
from Employees
where Role = 'Artist';

-- Task 2
Select Role, count(Role) as total_employees
from Employees
Group by Role;

-- Task 3
Select Role, sum(Years_employed)
from Employees
group by Role
having Role = 'Engineer';
