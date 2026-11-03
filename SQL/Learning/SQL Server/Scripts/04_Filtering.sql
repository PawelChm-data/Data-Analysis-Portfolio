/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 31–40
   TOPIC: WHERE / FILTERING
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 31
   Topic: Equality

   TASK:
   Retrieve customers from Germany.

   CONCEPTS:
   WHERE
   ================================================== */

select
	*
from Sales.Customers
where Country = 'Germany';


/* ==================================================
   EXERCISE 32
   Topic: Not equal

   TASK:
   Retrieve customers who are not from Germany.

   CONCEPTS:
   WHERE
   <>
   ================================================== */

select
	*
from Sales.Customers
where Country != 'Germany';


/* ==================================================
   EXERCISE 33
   Topic: Greater than

   TASK:
   Retrieve customers with Score greater than 500.

   CONCEPTS:
   >
   ================================================== */

select
	*
from Sales.Customers
where Score > 500;


/* ==================================================
   EXERCISE 34
   Topic: Greater than or equal

   TASK:
   Retrieve customers with Score greater than
   or equal to 500.

   CONCEPTS:
   >=
   ================================================== */

select
	*
from Sales.Customers
where Score >= 500;


/* ==================================================
   EXERCISE 35
   Topic: Less than

   TASK:
   Retrieve customers with Score below 500.

   CONCEPTS:
   <
   ================================================== */

select
	*
from Sales.Customers
where Score < 500;


/* ==================================================
   EXERCISE 36
   Topic: Less than or equal

   TASK:
   Retrieve customers with Score less than
   or equal to 500.

   CONCEPTS:
   <=
   ================================================== */

select
	*
from Sales.Customers
where Score <= 500;


/* ==================================================
   EXERCISE 37
   Topic: AND

   TASK:
   Retrieve customers from Germany whose Score
   is greater than 500.

   CONCEPTS:
   AND
   ================================================== */

select
	*
from Sales.Customers
where Country = 'Germany'
and Score > 500;


/* ==================================================
   EXERCISE 38
   Topic: OR

   TASK:
   Retrieve customers from Germany or the USA.

   CONCEPTS:
   OR
   ================================================== */

select
	*
from Sales.Customers
where Country = 'Germany' or Country = 'USA';


/* ==================================================
   EXERCISE 39
   Topic: Combining conditions

   TASK:
   Retrieve customers from Germany or the USA
   whose Score is greater than 500.

   CONCEPTS:
   AND
   OR
   Parentheses
   ================================================== */

select
	*
from Sales.Customers
where Score > 500 
and (Country = 'Germany' or Country = 'USA');


/* ==================================================
   EXERCISE 40
   Topic: Filtering Orders

   TASK:
   Retrieve orders with Sales greater than 100
   and Quantity greater than 1.

   CONCEPTS:
   WHERE
   AND
   ================================================== */

select
	*
from Sales.Orders
where Sales > 100 and Quantity > 1;