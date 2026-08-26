-- SQL Fundamentals at SQLBolt
-- Lesson: 6
-- Datset: https://sqlbolt.com/lesson/select_queries_review

-- Task 1
SELECT Title, Domestic_sales, International_sales FROM Movies
inner join Boxoffice 
on Id = Movie_id;

-- Task 2
SELECT Title, Domestic_sales, International_sales FROM Movies
inner join Boxoffice 
on Id = Movie_id
where International_sales > Domestic_sales;

-- Task 3
SELECT Title, Domestic_sales, International_sales FROM Movies
inner join Boxoffice 
on Id = Movie_id
order by Rating desc;
