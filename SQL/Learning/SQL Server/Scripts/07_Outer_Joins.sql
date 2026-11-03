/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 61–70
   TOPIC: OUTER JOINS
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 61
   Topic: LEFT JOIN

   TASK:
   Display all customers and their orders,
   including customers who have no orders.

   CONCEPTS:
   LEFT JOIN
   ================================================== */

select
	c.FirstName,
	c.LastName,
	o.OrderID,
	o.OrderDate,
	o.OrderStatus
from Sales.Customers as c
left join Sales.Orders as o
	on c.CustomerID = o.CustomerID;


/* ==================================================
   EXERCISE 62
   Topic: LEFT JOIN Products

   TASK:
   Display all products and matching orders,
   including products with no orders.

   CONCEPTS:
   LEFT JOIN
   ================================================== */

select
	p.Product,
	o.OrderID,
	o.ShipDate,
	o.OrderStatus
from Sales.Products as p
left join Sales.Orders as o
	on p.ProductID = o.ProductID;


/* ==================================================
   EXERCISE 63
   Topic: RIGHT JOIN

   TASK:
   Display all employees and matching orders,
   including employees without orders.

   CONCEPTS:
   RIGHT JOIN
   ================================================== */

select
	e.FirstName,
	e.LastName,
	o.OrderID,
	o.ShipDate,
	o.OrderStatus
from Sales.Orders as o
right join Sales.Employees as e
	on o.SalesPersonID = e.EmployeeID;


/* ==================================================
   EXERCISE 64
   Topic: RIGHT JOIN alternative

   TASK:
   Solve the previous exercise using LEFT JOIN
   instead of RIGHT JOIN.

   CONCEPTS:
   LEFT JOIN
   JOIN direction
   ================================================== */

select
	e.FirstName,
	e.LastName,
	o.OrderID,
	o.ShipDate,
	o.OrderStatus
from Sales.Employees as e
left join Sales.Orders as o 
	on o.SalesPersonID = e.EmployeeID;


/* ==================================================
   EXERCISE 65
   Topic: FULL JOIN

   TASK:
   Display all customers and all orders,
   including unmatched records from both tables.

   CONCEPTS:
   FULL JOIN
   ================================================== */

select
	c.FirstName,
	c.LastName,
	o.OrderID,
	o.OrderDate,
	o.OrderStatus
from Sales.Customers as c
full join Sales.Orders as o
	on c.CustomerID = o.CustomerID;


/* ==================================================
   EXERCISE 66
   Topic: LEFT JOIN + NULL

   TASK:
   Find customers who have no matching orders.

   CONCEPTS:
   LEFT JOIN
   IS NULL
   ================================================== */

select
	c.FirstName,
	c.LastName,
	o.OrderID,
	o.OrderDate,
	o.OrderStatus
from Sales.Customers as c
left join Sales.Orders as o
	on c.CustomerID = o.CustomerID
where o.OrderID is null;


/* ==================================================
   EXERCISE 67
   Topic: LEFT JOIN + NULL

   TASK:
   Find products that have never appeared
   in Sales.Orders.

   CONCEPTS:
   LEFT JOIN
   IS NULL
   ================================================== */

select
	p.Product,
	o.OrderID,
	o.OrderDate,
	o.OrderStatus
from Sales.Products as p
left join Sales.Orders as o
	on p.ProductID = o.ProductID
where o.OrderID is null;


/* ==================================================
   EXERCISE 68
   Topic: JOIN filtering

   TASK:
   Display all customers, but show only orders
   with Sales greater than 100.

   CONCEPTS:
   LEFT JOIN
   Filtering
   ================================================== */

select
	c.FirstName,
	c.LastName,
	o.OrderID,
	o.OrderDate,
	o.OrderStatus,
	o.Sales
from Sales.Customers as c
full join Sales.Orders as o
	on c.CustomerID = o.CustomerID
	and o.Sales > 100;


/* ==================================================
   EXERCISE 69
   Topic: Multi-table OUTER JOIN

   TASK:
   Display all customers and their products,
   including customers without orders.

   CONCEPTS:
   Multiple JOINs
   LEFT JOIN
   ================================================== */

select
    c.FirstName,
    c.LastName,
    p.Product,
    o.OrderID,
    o.OrderDate,
    o.OrderStatus
from Sales.Customers as c
left join Sales.Orders as o
    on c.CustomerID = o.CustomerID
left join Sales.Products as p
    on o.ProductID = p.ProductID;


/* ==================================================
   EXERCISE 70
   Topic: LEFT JOIN + NULL filtering

   TASK:
   Using a LEFT JOIN between Customers and Orders,
   find customers who have at least one order.
   Then modify the query to find customers
   who have no orders.

   CONCEPTS:
   LEFT JOIN
   IS NULL
   IS NOT NULL
   ================================================== */


/* ==================================================
   SOLUTION 1
   Customers who have at least one order
   ================================================== */

select
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.OrderStatus
from Sales.Customers as c
left join Sales.Orders as o
    on c.CustomerID = o.CustomerID
where o.OrderID is not null;


/* ==================================================
   SOLUTION 2
   Customers who have no orders
   ================================================== */

select
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.OrderStatus
from Sales.Customers as c
left join Sales.Orders as o
    on c.CustomerID = o.CustomerID
where o.OrderID is null;

