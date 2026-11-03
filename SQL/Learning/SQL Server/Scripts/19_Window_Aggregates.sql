/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 181–190
   TOPIC: Window Aggregate Functions
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 181
   Topic: SUM OVER

   TASK:
   Display OrderID, OrderDate, Sales, and total Sales across all orders.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, OrderDate, Sales

   CONCEPTS:
   Window Aggregate Functions
   ================================================== */

SELECT
	OrderID,
	OrderDate,
	Sales,
	SUM(Sales) OVER() AS TotalSales
FROM Sales.Orders;

/* ==================================================
   EXERCISE 182
   Topic: AVG OVER

   TASK:
   Display OrderID, Sales, and the overall average order Sales.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, Sales

   CONCEPTS:
   Window Aggregate Functions
   ================================================== */

SELECT
	OrderID,
	Sales,
	AVG(Sales) OVER() AS AvgSales
FROM Sales.Orders;

/* ==================================================
   EXERCISE 183
   Topic: Partition by customer

   TASK:
   Display OrderID, CustomerID, Sales, and total Sales per CustomerID.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, CustomerID, Sales

   CONCEPTS:
   Window Aggregate Functions
   ================================================== */

SELECT
	OrderID,
	CustomerID,
	Sales,
	SUM(Sales) OVER (PARTITION BY CustomerID) AS TotalSalesPerCustomer
FROM Sales.Orders;

/* ==================================================
   EXERCISE 184
   Topic: Partition by product

   TASK:
   Display OrderID, ProductID, Quantity, and total Quantity per ProductID using a window aggregate.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, ProductID, Quantity

   CONCEPTS:
   Window Aggregate Functions
   ================================================== */

SELECT
	OrderID,
	ProductID,
	Quantity,
	SUM(Quantity) OVER (PARTITION BY ProductID) AS TotalQuantityPerProduct
FROM Sales.Orders;

/* ==================================================
   EXERCISE 185
   Topic: Compare to overall total

   TASK:
   Display OrderID, Sales, overall Sales, and each order's percentage of total Sales. Use a window function and avoid integer division.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, Sales

   CONCEPTS:
   Window Aggregate Functions
   ================================================== */

SELECT
	OrderID,
	Sales,
	SUM(Sales) OVER() AS TotalSales,
	ROUND(CAST(Sales AS FLOAT) / NULLIF(SUM(Sales) OVER(), 0) * 100, 2) AS SalePercentage
FROM Sales.Orders;

/* ==================================================
   EXERCISE 186
   Topic: Compare to customer total

   TASK:
   Display OrderID, CustomerID, Sales, customer total Sales, and the difference between the order's Sales and that customer's total Sales.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, CustomerID, Sales

   CONCEPTS:
   Window Aggregate Functions
   ================================================== */

SELECT
    OrderID,
    CustomerID,
    Sales,
    SUM(Sales) OVER (PARTITION BY CustomerID) AS TotalSalesPerCustomer,
    Sales - SUM(Sales) OVER (PARTITION BY CustomerID) AS SalesDifference
FROM Sales.Orders;

/* ==================================================
   EXERCISE 187
   Topic: Department salary context

   TASK:
   Display EmployeeID, FirstName, Department, Salary, and average Salary within each Department.

   TABLES / COLUMNS:
   Sales.Employees: EmployeeID, FirstName, Department, Salary

   CONCEPTS:
   Window Aggregate Functions
   ================================================== */

SELECT
	EmployeeID,
	FirstName,
	Department,
	Salary,
	AVG(Salary) OVER (PARTITION BY Department) AS AvgSalaryPerDepartment
FROM Sales.Employees;

/* ==================================================
   EXERCISE 188
   Topic: Running total

   TASK:
   Return OrderID, OrderDate, Sales, and running total Sales ordered by OrderDate and OrderID. Use an explicit window frame.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, OrderDate, Sales

   CONCEPTS:
   Window Aggregate Functions
   ================================================== */

SELECT
	OrderID,
	OrderDate,
	Sales,
	SUM(Sales) OVER (ORDER BY OrderDate, OrderID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
FROM Sales.Orders;

/* ==================================================
   EXERCISE 189
   Topic: Running total per customer

   TASK:
   Return OrderID, CustomerID, OrderDate, Sales, and running total Sales within each CustomerID. Order deterministically by OrderDate and OrderID.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, CustomerID, OrderDate, Sales

   CONCEPTS:
   Window Aggregate Functions
   ================================================== */

SELECT
	OrderID,
	CustomerID,
	OrderDate,
	Sales,
	SUM(Sales) OVER(PARTITION BY CustomerID ORDER BY OrderDate, OrderID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotalPerCustomer
FROM Sales.Orders;

/* ==================================================
   EXERCISE 190
   Topic: Moving average

   TASK:
   Calculate a three-row moving average of Sales over orders ordered by OrderDate and OrderID. Return the current Sales and moving average.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, OrderDate, Sales

   CONCEPTS:
   Window Aggregate Functions
   ================================================== */

SELECT
	OrderID,
	OrderDate,
	Sales,
	AVG(Sales) OVER(ORDER BY OrderDate, OrderID ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MovingAvgSales
FROM Sales.Orders;

