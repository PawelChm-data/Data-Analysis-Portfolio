-- SQL Fundamentals at SQLBolt
-- Lesson: 9
-- Dataset: https://sqlbolt.com/lesson/select_queries_with_expressions

-- Task 1
SELECT Movies.Title, (Boxoffice.Domestic_sales + Boxoffice.International_sales) / 1000000 as Combined_sales from Boxoffice
inner join Movies
on Movies.Id = Boxoffice.Movie_id
order by Combined_sales desc

-- Task 2
SELECT Movies.Title, Boxoffice.Rating * 10 as Rating_Percentage from Boxoffice
inner join Movies
on Movies.Id = Boxoffice.Movie_id
order by Rating desc

-- Task 3
SELECT Title, Year FROM movies
WHERE year % 2 = 0;
