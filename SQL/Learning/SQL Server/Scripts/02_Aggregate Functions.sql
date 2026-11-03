/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 11-20
   TOPIC: Subqueries
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 11
   Topic: COUNT
   ==================================================

   TASK:
   Count the total number of customers.

   CONCEPTS:
   COUNT
   ================================================== */

select
	count(CustomerID) as TotalCustomers
from Sales.Customers;


/* ==================================================
   EXERCISE 12
   Topic: COUNT(column)
   ==================================================

   TASK:
   Count how many customers have a non-NULL Score.

   CONCEPTS:
   COUNT(column)
   NULL
   ================================================== */

select
	count(Score) as CustomersWithScore
from Sales.Customers;


/* ==================================================
   EXERCISE 13
   Topic: SUM
   ==================================================

   TASK:
   Calculate the total Sales from Sales.Orders.

   CONCEPTS:
   SUM
   ================================================== */

select
	sum(Sales) as TotalSales
from Sales.Orders;


/* ==================================================
   EXERCISE 14
   Topic: AVG
   ==================================================

   TASK:
   Calculate the average customer Score.

   CONCEPTS:
   AVG
   ================================================== */

select
	avg(Score) as AverageScore
from Sales.Customers;


/* ==================================================
   EXERCISE 15
   Topic: MIN
   ==================================================

   TASK:
   Find the lowest customer Score.

   CONCEPTS:
   MIN
   ================================================== */

select
	min(Score) as MinimumScore
from Sales.Customers;


/* ==================================================
   EXERCISE 16
   Topic: MAX
   ==================================================

   TASK:
   Find the highest customer Score.

   CONCEPTS:
   MAX
   ================================================== */

select
	max(Score) as MaximumScore
from Sales.Customers;


/* ==================================================
   EXERCISE 17
   Topic: Aggregate functions together
   ==================================================

   TASK:
   Return the total number of customers,
   minimum Score, maximum Score and average Score.

   CONCEPTS:
   COUNT
   MIN
   MAX
   AVG
   ================================================== */

select
	count(CustomerID) as TotalCustomers,
	min(Score) as MinimumScore,
	max(Score) as MaximumScore,
	avg(Score) as AverageScore
from Sales.Customers;


/* ==================================================
   EXERCISE 18
   Topic: Sales analysis
   ==================================================

   TASK:
   Return the number of orders, total Sales,
   minimum Sales, maximum Sales and average Sales.

   CONCEPTS:
   COUNT
   SUM
   MIN
   MAX
   AVG
   ================================================== */

select
	count(OrderID) as NumberOfOrders,
	sum(Sales) as TotalSales,
	min(Sales) as MinimumSales,
	max(Sales) as MaximumSales,
	avg(Sales) as AverageSales
from Sales.Orders;


/* ==================================================
   EXERCISE 19
   Topic: COUNT DISTINCT
   ==================================================

   TASK:
   Count the number of unique countries
   represented in Sales.Customers.

   CONCEPTS:
   COUNT
   DISTINCT
   ================================================== */

select
	count(distinct Country) as TotalUniqueCountries
from Sales.Customers;


/* ==================================================
   EXERCISE 20
   Topic: Aggregate expressions
   ==================================================

   TASK:
   Calculate the average Sales value per order.
   Return the result as a single value.

   CONCEPTS:
   AVG
   Aggregate analysis
   ================================================== */

select
	avg(Sales) as AverageSalesPerOrder
from Sales.Orders;