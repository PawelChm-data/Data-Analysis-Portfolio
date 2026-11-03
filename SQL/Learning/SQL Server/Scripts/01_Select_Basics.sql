/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 01-10
   TOPIC: Subqueries
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 01
   Topic: SELECT *
   
   TASK:
   Display all columns from the Sales.Customers table.
   
   CONCEPTS:
   SELECT
   FROM
   ================================================== */

SELECT *
FROM Sales.Customers;


/* ==================================================
   EXERCISE 02
   Topic: SELECT specific columns
   
   TASK:
   Display CustomerID, FirstName and LastName
   from Sales.Customers.
   
   CONCEPTS:
   Selecting specific columns
   ================================================== */

SELECT
    CustomerID,
    FirstName,
    LastName
FROM Sales.Customers;


/* ==================================================
   EXERCISE 03
   Topic: Column aliases
   
   TASK:
   Display FirstName and LastName.
   Rename the columns to CustomerFirstName
   and CustomerLastName.
   
   CONCEPTS:
   AS
   Column aliases
   ================================================== */

SELECT
    FirstName AS CustomerFirstName,
    LastName AS CustomerLastName
FROM Sales.Customers;


/* ==================================================
   EXERCISE 04
   Topic: Calculated columns
   
   TASK:
   Display OrderID, Quantity and Sales.
   Create a calculated column that increases
   Sales by 10%.
   
   CONCEPTS:
   Calculated columns
   Arithmetic operators
   Column aliases
   ================================================== */

SELECT
    OrderID,
    Quantity,
    Sales,
    Sales * 1.10 AS SalesWithIncrease
FROM Sales.Orders;


/* ==================================================
   EXERCISE 05
   Topic: DISTINCT
   
   TASK:
   Display all unique customer countries
   from Sales.Customers.
   
   CONCEPTS:
   DISTINCT
   ================================================== */

SELECT DISTINCT
    Country
FROM Sales.Customers;


/* ==================================================
   EXERCISE 06
   Topic: DISTINCT with multiple columns
   
   TASK:
   Display unique combinations of Country
   and Score from Sales.Customers.
   
   CONCEPTS:
   DISTINCT
   Multiple columns
   ================================================== */

SELECT DISTINCT
    Country,
    Score
FROM Sales.Customers;


/* ==================================================
   EXERCISE 07
   Topic: TOP
   
   TASK:
   Display the first 5 orders from Sales.Orders.
   
   Return all columns.
   
   CONCEPTS:
   TOP
   ================================================== */

SELECT TOP 5
    *
FROM Sales.Orders;


/* ==================================================
   EXERCISE 08
   Topic: TOP + ORDER BY
   
   TASK:
   Display the 10 most recent orders.
   
   Return:
   - OrderID
   - OrderDate
   
   CONCEPTS:
   TOP
   ORDER BY
   DESC
   ================================================== */

SELECT TOP 10
    OrderID,
    OrderDate
FROM Sales.Orders
ORDER BY OrderDate DESC;


/* ==================================================
   EXERCISE 09
   Topic: Calculated columns
   
   TASK:
   Display OrderID, Quantity and Sales.
   
   Create a calculated column that shows
   Sales increased by 20%.
   
   CONCEPTS:
   Arithmetic expressions
   Column aliases
   ================================================== */

SELECT
    OrderID,
    Quantity,
    Sales,
    Sales * 1.20 AS SalesWith20PercentIncrease
FROM Sales.Orders;


/* ==================================================
   EXERCISE 10
   Topic: Calculated columns + multiple columns
   
   TASK:
   Display:
   - OrderID
   - ProductID
   - Quantity
   - Sales
   
   Create a calculated column that shows
   Sales decreased by 10%.
   
   CONCEPTS:
   SELECT
   Calculated columns
   Arithmetic operators
   Aliases
   ================================================== */

SELECT
    OrderID,
    ProductID,
    Quantity,
    Sales,
    Sales * 0.90 AS SalesAfter10PercentDiscount
FROM Sales.Orders;