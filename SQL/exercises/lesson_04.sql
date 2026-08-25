-- SQL Fundamentals at SQLBolt
-- Lesson: 4
-- Datset: https://sqlbolt.com/lesson/filtering_sorting_query_results

-- Task 1
SELECT DISTINCT director FROM movies ORDER BY director ASC;

-- Task 2
SELECT title, year FROM movies ORDER BY year DESC LIMIT 4;

-- Task 3
select Title, Year from movies order by Title asc limit 5;

-- Task 4
SELECT title FROM movies ORDER BY title ASC LIMIT 5 OFFSET 5;
