-- SQL Fundamentals at SQLBolt
-- Lesson: 17
-- Dataset: https://sqlbolt.com/lesson/altering_tables

-- Task 1
alter table Movies
add column Aspect_ratio float;

-- Task 2
alter table Movies
add column Language text
default English;
