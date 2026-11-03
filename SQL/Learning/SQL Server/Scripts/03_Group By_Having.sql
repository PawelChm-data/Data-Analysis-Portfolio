/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 21-30
   TOPIC: Subqueries
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 21
   Topic: GROUP BY
   ==================================================

   TASK:
   Calculate the total Score for each Country.

   CONCEPTS:
   GROUP BY
   SUM
   ================================================== */

select
	sum(Score),
	Country
from Sales.Customers
group by Country;


/* ==================================================
   EXERCISE 22
   Topic: GROUP BY with COUNT
   ==================================================

   TASK:
   Count the number of customers in each Country.

   CONCEPTS:
   GROUP BY
   COUNT
   ================================================== */

select 
	COUNT(CustomerID) as total_customers,
	Country
from Sales.Customers
group by Country;


/* ==================================================
   EXERCISE 23
   Topic: GROUP BY with AVG
   ==================================================

   TASK:
   Calculate the average Score for each Country.

   CONCEPTS:
   GROUP BY
   AVG
   ================================================== */

select
	avg(Score) as avg_score,
	Country
from Sales.Customers
group by Country;


/* ==================================================
   EXERCISE 24
   Topic: GROUP BY with MIN and MAX
   ==================================================

   TASK:
   Return the minimum and maximum Score
   for each Country.

   CONCEPTS:
   GROUP BY
   MIN
   MAX
   ================================================== */

select 
	min(Score) as min_score,
	max(Score) as max_score,
	Country
from Sales.Customers
group by Country


/* ==================================================
   EXERCISE 25
   Topic: Multiple GROUP BY columns
   ==================================================

   TASK:
   Count customers grouped by Country and Score.

   CONCEPTS:
   GROUP BY
   Multiple columns
   ================================================== */

select 
	count(CustomerID) as total_customers,
	Country,
	Score
from Sales.Customers
group by Country,
Score;


/* ==================================================
   EXERCISE 26
   Topic: GROUP BY Orders
   ==================================================

   TASK:
   Calculate total Sales for each CustomerID.

   CONCEPTS:
   GROUP BY
   SUM
   ================================================== */

select 
	CustomerID,
	sum(Sales) as total_sales
from Sales.Orders
group by CustomerID

/* ==================================================
   EXERCISE 27
   Topic: GROUP BY Product
   ==================================================

   TASK:
   Calculate total Quantity ordered for each ProductID.

   CONCEPTS:
   GROUP BY
   SUM
   ================================================== */

select 
	ProductID,
	sum(Quantity)
from Sales.Orders
group by ProductID


/* ==================================================
   EXERCISE 28
   Topic: HAVING
   ==================================================

   TASK:
   Display countries whose total customer Score
   is greater than 500.

   CONCEPTS:
   GROUP BY
   HAVING
   SUM
   ================================================== */

select
	Country,
	sum(Score)
from Sales.Customers
group by Country
having sum(Score) > 500;



/* ==================================================
   EXERCISE 29
   Topic: HAVING with COUNT
   ==================================================

   TASK:
   Display countries containing more than one customer.

   CONCEPTS:
   GROUP BY
   HAVING
   COUNT
   ================================================== */

select
	Country,
	count(CustomerID)
from Sales.Customers
group by Country
having count(CustomerID) > 1;


/* ==================================================
   EXERCISE 30
   Topic: WHERE vs HAVING
   ==================================================

   TASK:
   Consider only customers with Score greater than 0.
   Then return countries whose average Score is
   greater than 500.

   CONCEPTS:
   WHERE
   GROUP BY
   HAVING
   AVG
   ================================================== */

select
	Country,
	avg(Score) as avg_score
from Sales.Customers
where score > 0
group by Country
having avg(Score) > 500;


