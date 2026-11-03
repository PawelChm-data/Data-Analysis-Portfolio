/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 211–220
   TOPIC: Common Table Expressions (CTEs)
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 211
   Topic: Basic CTE

   TASK:
   Create a CTE that selects employees from Sales.Employees, then return employees whose Salary exceeds a threshold you choose.

   TABLES / COLUMNS:
   Sales.Employees: EmployeeID, FirstName, LastName, Salary

   CONCEPTS:
   Common Table Expressions (CTEs)
   ================================================== */

WITH CTE_1 AS (
SELECT
	EmployeeID,
	FirstName,
	LastName,
	Salary
FROM Sales.Employees)

SELECT
    *
FROM CTE_1
WHERE Salary > 75000;

/* ==================================================
   EXERCISE 212
   Topic: CTE with calculated column

   TASK:
   Create a CTE that calculates each product's Price with a 10% increase. Return ProductID, Product, original Price, and adjusted Price.

   TABLES / COLUMNS:
   Sales.Products: ProductID, Product, Price

   CONCEPTS:
   Common Table Expressions (CTEs)
   ================================================== */

WITH CTE_2 AS (
SELECT
	ProductID,
	Product,
	Price,
	1.1 * Price AS AdjustedPrice
FROM Sales.Products)

SELECT
	ProductID,
	Product,
	Price,
	AdjustedPrice
FROM CTE_2;

/* ==================================================
   EXERCISE 213
   Topic: Aggregate CTE

   TASK:
   Create a CTE that aggregates total Sales by CustomerID, then return customers whose total Sales exceeds a threshold you choose.

   TABLES / COLUMNS:
   Sales.Orders: CustomerID, Sales

   CONCEPTS:
   Common Table Expressions (CTEs)
   ================================================== */

WITH CTE_3 AS (
SELECT
	CustomerID,
	SUM(Sales) AS TotalSalesPerCustomer
FROM Sales.Orders
GROUP BY CustomerID)

SELECT 
	*
FROM CTE_3
WHERE TotalSalesPerCustomer > 100;

/* ==================================================
   EXERCISE 214
   Topic: Multiple CTEs

   TASK:
   Create one CTE for order totals by customer and another for customer details. Join them to show customer name and total Sales.

   TABLES / COLUMNS:
   Sales.Orders: CustomerID, Sales; Sales.Customers: CustomerID, FirstName, LastName

   CONCEPTS:
   Common Table Expressions (CTEs)
   ================================================== */

WITH OrderTotals AS (
SELECT
	CustomerID,
	SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY CustomerID)

, CustomerDetails AS (
SELECT
	CustomerID,
	FirstName,
	LastName
FROM Sales.Customers)

SELECT
    CD.CustomerID,
    CONCAT(CD.FirstName, ' ', CD.LastName) AS FullName,
    OT.TotalSales
FROM CustomerDetails AS CD
INNER JOIN OrderTotals AS OT
ON CD.CustomerID = OT.CustomerID
ORDER BY OT.TotalSales DESC;

/* ==================================================
   EXERCISE 215
   Topic: CTE with ranking

   TASK:
   Create a CTE that ranks products by Price within Category, then return the top two products per Category.

   TABLES / COLUMNS:
   Sales.Products: ProductID, Product, Category, Price

   CONCEPTS:
   Common Table Expressions (CTEs)
   ================================================== */

WITH CTE_4 AS (
	SELECT
	ProductID,
	Product,
	Category,
	Price,
	RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS Ranking
FROM Sales.Products)

SELECT
	*
FROM CTE_4
WHERE Ranking <= 2
ORDER BY Category, Price DESC;

/* ==================================================
   EXERCISE 216
   Topic: CTE with date filtering

   TASK:
   Create a CTE that filters orders to a date range using OrderDate, then summarize order count and total Sales by year.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, OrderDate, Sales

   CONCEPTS:
   Common Table Expressions (CTEs)
   ================================================== */

WITH CTE_5 AS (
SELECT
	OrderID,
	OrderDate,
	Sales
FROM Sales.Orders
WHERE OrderDate >= '2025-01-10'
	  AND OrderDate < '2025-02-19')

SELECT
    YEAR(OrderDate) AS OrderYear,
    COUNT(OrderID) AS TotalOrders,
    SUM(Sales) AS TotalSales
FROM CTE_5
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;

/* ==================================================
   EXERCISE 217
   Topic: CTE for department averages

   TASK:
   Create a CTE with average Salary by Department, then list employees earning above their department average.

   TABLES / COLUMNS:
   Sales.Employees: EmployeeID, FirstName, Department, Salary

   CONCEPTS:
   Common Table Expressions (CTEs)
   ================================================== */

WITH CTE_6 AS (
SELECT
	EmployeeID,
	FirstName,
	Department,
	Salary,
	AVG(Salary) OVER(PARTITION BY Department) AS AvgSalaryPerDepartment
FROM Sales.Employees)

SELECT
	*
FROM CTE_6
WHERE Salary > AvgSalaryPerDepartment;

/* ==================================================
   EXERCISE 218
   Topic: CTE for customer order counts

   TASK:
   Create a CTE with order count by CustomerID, then join it to Sales.Customers to show customer name and order count. Preserve customers with no orders.

   TABLES / COLUMNS:
   Sales.Customers: CustomerID, FirstName, LastName; Sales.Orders: CustomerID, OrderID

   CONCEPTS:
   Common Table Expressions (CTEs)
   ================================================== */

WITH CTE_7 AS (
SELECT
	CustomerID,
	FirstName,
	LastName
FROM Sales.Customers)

, CTE_8 AS (
SELECT
	CustomerID,
	COUNT(OrderID) AS TotalOrders
FROM Sales.Orders
GROUP BY CustomerID)

SELECT
    C7.CustomerID,
    CONCAT(C7.FirstName, ' ', C7.LastName) AS FullName,
    ISNULL(C8.TotalOrders, 0) AS TotalOrders
FROM CTE_7 AS C7
LEFT JOIN CTE_8 AS C8
    ON C7.CustomerID = C8.CustomerID
ORDER BY C7.CustomerID;

/* ==================================================
   EXERCISE 219
   Topic: CTE for product sales

   TASK:
   Create a CTE aggregating Quantity and Sales by ProductID, then join to Sales.Products and return products with their sales metrics.

   TABLES / COLUMNS:
   Sales.Orders: ProductID, Quantity, Sales; Sales.Products: ProductID, Product

   CONCEPTS:
   Common Table Expressions (CTEs)
   ================================================== */

WITH CTE_9 AS (
SELECT
	ProductID,
	SUM(Quantity) AS TotalQuantity,
    SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY ProductID)

, CTE_10 AS (
SELECT
	ProductID,
	Product
FROM Sales.Products)

SELECT
	C10.ProductID,
	C10.Product,
    ISNULL(C9.TotalQuantity, 0) AS TotalQuantity,
    ISNULL(C9.TotalSales, 0) AS TotalSales
FROM CTE_10 AS C10
LEFT JOIN CTE_9 AS C9
ON C9.ProductID = C10.ProductID
ORDER BY C10.ProductID;

/* ==================================================
   EXERCISE 220
   Topic: Multi-step analysis

   TASK:
   Use at least two CTEs to calculate total Sales by customer, rank customers by total Sales, and return the top five with customer names.

   TABLES / COLUMNS:
   Sales.Orders: CustomerID, Sales; Sales.Customers: CustomerID, FirstName, LastName

   CONCEPTS:
   Common Table Expressions (CTEs)
   ================================================== */

WITH CTE_11 AS (
SELECT
	CustomerID,
	SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY CustomerID)

, CTE_12 AS (
SELECT
	C11.CustomerID,
	C.FirstName,
	C.LastName,
	C11.TotalSales,
	RANK() OVER(ORDER BY C11.TotalSales DESC) AS SalesRank
FROM CTE_11 AS C11
INNER JOIN Sales.Customers AS C
ON C11.CustomerID = C.CustomerID)

SELECT
    CustomerID,
    FirstName,
    LastName,
    TotalSales,
    SalesRank
FROM CTE_12
WHERE SalesRank <= 5
ORDER BY SalesRank, CustomerID;