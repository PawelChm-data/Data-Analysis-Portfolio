-- SQL Fundamentals at SQLBolt
-- Lesson: 5
-- Dataset: https://sqlbolt.com/lesson/select_queries_review

-- Task 1
SELECT * FROM north_american_cities 
where Country = 'Canada';

-- Task 2
select * from North_american_cities 
where country = 'United States' 
order by Latitude desc;

-- Task 3
select * from North_american_cities
where Longitude < -87.629798
order by Longitude asc;

-- Task 4
select * from North_american_cities 
where Country = 'Mexico'
order by Population desc limit 2;

-- Task 5
select * from North_american_cities
where Country = 'United States'
order by Population desc limit 2 offset 2;
