/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 71–80
   TOPIC: SET OPERATORS
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 71
   Topic: UNION

   TASK:
   Combine FirstName values from Customers
   and Employees into one result.

   CONCEPTS:
   UNION
   ================================================== */

select
	FirstName
from Sales.Customers
union
select 
	FirstName
from Sales.Employees;
	

/* ==================================================
   EXERCISE 72
   Topic: UNION ALL

   TASK:
   Combine FirstName values from Customers
   and Employees using UNION ALL.

   CONCEPTS:
   UNION ALL
   ================================================== */

select
	FirstName
from Sales.Customers
union all
select 
	FirstName
from Sales.Employees;


/* ==================================================
   EXERCISE 73
   Topic: UNION vs UNION ALL

   TASK:
   Create two queries using UNION and UNION ALL
   and compare the number of returned rows.

   CONCEPTS:
   UNION
   UNION ALL
   Duplicates
   ================================================== */

select
	FirstName
from Sales.Customers
union
select 
	FirstName
from Sales.Employees

select
	FirstName
from Sales.Customers
union all
select 
	FirstName
from Sales.Employees; 


/* ==================================================
   EXERCISE 74
   Topic: EXCEPT

   TASK:
   Find countries that appear among all customers
   but do not appear among customers with a Score
   greater than 500.

   CONCEPTS:
   EXCEPT
   ================================================== */

select 
	Country
from Sales.Customers

except

select 
	Country
from Sales.Customers
where Score > 500;


/* ==================================================
   EXERCISE 75
   Topic: INTERSECT

   TASK:
   Find countries that have at least one customer
   with a Score greater than 500 and also have
   at least one customer with a Score of 500 or less.

   CONCEPTS:
   INTERSECT
   ================================================== */

select
	Country
from Sales.Customers
where Score > 500

intersect

select
	country
from Sales.Customers
where Score <= 500;


/* ==================================================
   EXERCISE 76
   Topic: EXCEPT with IDs

   TASK:
   Find CustomerID values belonging to customers
   from Germany who do not belong to customers
   from the USA.

   CONCEPTS:
   EXCEPT
   ================================================== */

select
	CustomerID
from Sales.Customers
where Country = 'Germany'

except 

select
	CustomerID
from Sales.Customers
where Country = 'USA';


/* ==================================================
   EXERCISE 77
   Topic: INTERSECT with IDs

   TASK:
   Find CustomerID values belonging to customers
   from Germany who also have a Score greater than 500.

   CONCEPTS:
   INTERSECT
   ================================================== */

select
	CustomerID
from Sales.Customers
where Country = 'Germany'

intersect 

select
	CustomerID
from Sales.Customers
where Score > 500;


/* ==================================================
   EXERCISE 78
   Topic: UNION with aliases

   TASK:
   Combine customer first names and employee first names
   into a single column called PersonName.

   CONCEPTS:
   UNION
   Aliases
   ================================================== */

select
	FirstName as PersonName
from Sales.Customers

union

select
	FirstName
from Sales.Employees;


/* ==================================================
   EXERCISE 79
   Topic: UNION + filtering

   TASK:
   Combine the first names of customers from Germany
   with the first names of employees whose salary
   is greater than 5000.
   Apply a filter to each individual query before
   combining the results.

   CONCEPTS:
   UNION
   WHERE
   ================================================== */

select
	FirstName as PersonName
from Sales.Customers
where Country = 'Germany'

union

select
	FirstName
from Sales.Employees
where Salary > 5000;

/* ==================================================
   EXERCISE 80
   Topic: Set operators + ORDER BY

   TASK:
   Combine customer and employee first names into
   a single result and sort the final result
   alphabetically by name.

   CONCEPTS:
   UNION
   ORDER BY
   ================================================== */

select
	FirstName as PersonName
from Sales.Customers

union

select
	FirstName
from Sales.Employees
order by PersonName asc;