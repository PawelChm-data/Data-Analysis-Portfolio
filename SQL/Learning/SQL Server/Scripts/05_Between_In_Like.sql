/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 41–50
   TOPIC: BETWEEN / IN / LIKE
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 41
   Topic: BETWEEN

   TASK:
   Retrieve customers whose Score is between 300
   and 700.

   CONCEPTS:
   BETWEEN
   ================================================== */

select
	*
from Sales.Customers
where Score between 300 and 700;


/* ==================================================
   EXERCISE 42
   Topic: NOT BETWEEN

   TASK:
   Retrieve customers whose Score is not between
   300 and 700.

   CONCEPTS:
   NOT BETWEEN
   ================================================== */

select
	*
from Sales.Customers
where Score not between 300 and 700;


/* ==================================================
   EXERCISE 43
   Topic: IN

   TASK:
   Retrieve customers from Germany, USA or UK.

   CONCEPTS:
   IN
   ================================================== */

select
	*
from Sales.Customers
where Country in('Germany', 'USA', 'UK');


/* ==================================================
   EXERCISE 44
   Topic: NOT IN

   TASK:
   Retrieve customers whose Country is not
   Germany, USA or UK.

   CONCEPTS:
   NOT IN
   ================================================== */

select
	*
from Sales.Customers
where Country not in('Germany', 'USA', 'UK');


/* ==================================================
   EXERCISE 45
   Topic: LIKE

   TASK:
   Find customers whose FirstName starts with 'M'.

   CONCEPTS:
   LIKE
   %
   ================================================== */

select
	*
from Sales.Customers
where FirstName like 'M%';


/* ==================================================
   EXERCISE 46
   Topic: LIKE ending pattern

   TASK:
   Find customers whose LastName ends with 'n'.

   CONCEPTS:
   LIKE
   ================================================== */

select
	*
from Sales.Customers
where LastName like '%n';


/* ==================================================
   EXERCISE 47
   Topic: LIKE contains

   TASK:
   Find customers whose FirstName contains
   the letter 'a'.

   CONCEPTS:
   LIKE
   %...%
   ================================================== */

select
	*
from Sales.Customers
where FirstName like '%a%';


/* ==================================================
   EXERCISE 48
   Topic: LIKE single character

   TASK:
   Find customers whose FirstName has 'a'
   as the second character.

   CONCEPTS:
   LIKE
   _
   ================================================== */

select
	*
from Sales.Customers
where FirstName like '_a%';


/* ==================================================
   EXERCISE 49
   Topic: Combining IN and AND

   TASK:
   Retrieve customers from Germany or USA
   whose Score is greater than 500.

   CONCEPTS:
   IN
   AND
   ================================================== */

select
	*
from Sales.Customers
where Country in ('Germany', 'USA')
and Score > 500;


/* ==================================================
   EXERCISE 50
   Topic: Filtering Orders

   TASK:
   Retrieve orders where OrderStatus is either
   'Delivered' or 'Shipped'.

   CONCEPTS:
   IN
   WHERE
   ================================================== */

select
	*
from Sales.Orders
where OrderStatus in ('Delivered', 'Shipped');