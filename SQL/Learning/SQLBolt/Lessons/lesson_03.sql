-- SQL Fundamentals at SQLBolt
-- Lesson: 3
-- Dataset: https://sqlbolt.com/lesson/select_queries_with_constraints_pt_2

-- Task 1
select * from Movies where Title like "%Toy Story%";

-- Task 2
select * from Movies where Director = "John Lasseter";

-- Task 3
select * from Movies where Director != "John Lasseter";

-- Task 4
select * from Movies where Title like "%WALL%";
