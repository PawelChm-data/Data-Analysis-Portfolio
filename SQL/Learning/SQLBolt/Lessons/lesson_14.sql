-- SQL Fundamentals at SQLBolt
-- Lesson: 14
-- Dataset: https://sqlbolt.com/lesson/updating_rows

-- Task 1
update Movies
set Director = 'John Lasseter'
where Id = 2;

-- Task 2
update Movies 
set Year = 1999
where Id = 3;

-- Task 3
update Movies
set Title = 'Toy Story 3',
Director = 'Lee Unkrich'
where Id = 11;
