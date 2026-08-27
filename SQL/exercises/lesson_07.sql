-- SQL Fundamentals at SQLBolt
-- Lesson: 7
-- Datset: https://sqlbolt.com/lesson/select_queries_with_outer_joins

-- Task 1
select distinct Buildings.Building_name, Employees.Name from Buildings
left join Employees
on Buildings.Building_name = Employees.Building;

-- Task 2
select Buildings.Building_name, Capacity from Buildings
left join Employees
on Buildings.Building_name = Employees.Building;

-- Task 3
SELECT DISTINCT Buildings.building_name, Employees.Role, FROM buildings 
LEFT JOIN employees
ON Buildings.building_name = Employees.building;
