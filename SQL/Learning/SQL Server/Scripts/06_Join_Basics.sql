/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 51–60
   TOPIC: JOIN BASICS
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 51
   Topic: INNER JOIN

   TASK:
   Join Sales.Orders with Sales.Customers
   using CustomerID.
   Display OrderID, CustomerID, FirstName and LastName.

   CONCEPTS:
   INNER JOIN
   Primary key / Foreign key
   ================================================== */

select
	Sales.Orders.OrderID,
	Sales.Customers.CustomerID,
	Sales.Customers.FirstName,
	Sales.Customers.LastName
from Sales.Orders
inner join Sales.Customers
on Sales.Orders.CustomerID = Sales.Customers.CustomerID;


/* ==================================================
   EXERCISE 52
   Topic: Orders + Products

   TASK:
   Join Sales.Orders with Sales.Products
   using ProductID.
   Display OrderID, ProductID, Product and Price.

   CONCEPTS:
   INNER JOIN
   ================================================== */

select
	o.OrderID,
	p.ProductID,
	p.Product,
	p.Price
from Sales.Orders as o
inner join Sales.Products as p
on o.ProductID = p.ProductID;


/* ==================================================
   EXERCISE 53
   Topic: Orders + Employees

   TASK:
   Join Sales.Orders with Sales.Employees
   using SalesPersonID and EmployeeID.
   Display OrderID and employee name.

   CONCEPTS:
   INNER JOIN
   ================================================== */

select
	o.OrderID,
	e.FirstName
from Sales.Orders as o
inner join Sales.Employees as e
on o.SalesPersonID = e.EmployeeID;


/* ==================================================
   EXERCISE 54
   Topic: Three-table JOIN

   TASK:
   Join Orders, Customers and Products.
   Display OrderID, customer name and product name.

   CONCEPTS:
   Multiple JOINs
   ================================================== */

select
	o.OrderID,
	c.FirstName,
	p.Product
from Sales.Orders as o
inner join Sales.Customers as c
on o.CustomerID = c.CustomerID
inner join Sales.Products as p
on o.ProductID = p.ProductID;


/* ==================================================
   EXERCISE 55
   Topic: JOIN with aliases

   TASK:
   Repeat the previous exercise using table aliases.

   CONCEPTS:
   Table aliases
   ================================================== */

select
	o.OrderID,
	c.FirstName,
	p.Product
from Sales.Orders as o
inner join Sales.Customers as c
on o.CustomerID = c.CustomerID
inner join Sales.Products as p
on o.ProductID = p.ProductID;


/* ==================================================
   EXERCISE 56
   Topic: JOIN + calculated column

   TASK:
   Join Orders and Products.
   Display Product, Quantity and Price.
   Calculate the order value using Quantity and Price.

   CONCEPTS:
   JOIN
   Calculated columns
   ================================================== */

select
	p.Product,
	o.Quantity,
	p.Price,
	o.Quantity * p.Price as order_value
from Sales.Orders as o
inner join Sales.Products as p
on o.ProductID = p.ProductID;


/* ==================================================
   EXERCISE 57
   Topic: JOIN + WHERE

   TASK:
   Join Orders and Customers.
   Return only orders belonging to customers
   from Germany.

   CONCEPTS:
   JOIN
   WHERE
   ================================================== */

select
	c.CustomerID,
	c.FirstName,
	c.LastName,
	c.Country,
	o.OrderID,
	o.OrderStatus
from Sales.Orders as o
inner join Sales.Customers as c
on o.CustomerID = c.CustomerID
where c.Country = 'Germany';


/* ==================================================
   EXERCISE 58
   Topic: JOIN + ORDER BY

   TASK:
   Join Orders and Products.
   Display products and order Sales.
   Sort Sales from highest to lowest.

   CONCEPTS:
   JOIN
   ORDER BY
   ================================================== */

select
	p.Product,
	o.Sales
from Sales.Orders as o
inner join Sales.Products as p
on o.ProductID = p.ProductID
order by o.Sales desc;


/* ==================================================
   EXERCISE 59
   Topic: JOIN + aggregation

   TASK:
   Join Orders and Products.
   Calculate total Quantity for each Product.

   CONCEPTS:
   JOIN
   GROUP BY
   SUM
   ================================================== */

select
	p.Product,
	sum(o.Quantity) as total_quantity
from Sales.Orders as o
inner join Sales.Products as p
on o.ProductID = p.ProductID
group by p.Product;


/* ==================================================
   EXERCISE 60
   Topic: JOIN + aggregation

   TASK:
   Join Orders and Customers.
   Calculate total Sales for each customer.

   CONCEPTS:
   JOIN
   GROUP BY
   SUM
   ================================================== */

select
	c.FirstName,
	c.LastName,
	sum(o.Sales) as total_sales
from Sales.Customers as c
left join Sales.Orders as o
on o.CustomerID = c.CustomerID
group by c.FirstName, c.LastName;