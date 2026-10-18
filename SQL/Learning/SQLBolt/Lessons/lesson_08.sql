-- SQL Fundamentals at SQLBolt
-- Lesson: 8
-- Dataset: https://sqlbolt.com/lesson/select_queries_with_nulls

-- Task 1
select Role, Name, Building from Employees
where Building is null;

-- Task 2
Select distinct Building_name from Buildings
left join Employees
on Buildings.Building_name = Employees.Building
where Employees.Role is null;
