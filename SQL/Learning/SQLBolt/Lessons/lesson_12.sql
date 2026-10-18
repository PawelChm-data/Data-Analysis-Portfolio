-- SQL Fundamentals at SQLBolt
-- Lesson: 12
-- Dataset: https://sqlbolt.com/lesson/select_queries_order_of_execution

-- Task 1
select Director,
count(Title) as Counted_titles
from Movies
group by Director;

-- Task 2
Select Movies.Director,
sum(Boxoffice.Domestic_sales + Boxoffice.International_sales) as Total
from Movies
inner join Boxoffice
on Movies.Id = Boxoffice.Movie_id
group by Director;
