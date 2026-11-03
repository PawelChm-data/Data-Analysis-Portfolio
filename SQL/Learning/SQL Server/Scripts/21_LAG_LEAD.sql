/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 201–210
   TOPIC: LAG and LEAD
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 201
   Topic: LAG previous order

   TASK:
   For each order, display OrderID, OrderDate, Sales, and the previous row's Sales ordered by OrderDate and OrderID.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, OrderDate, Sales

   CONCEPTS:
   LAG and LEAD
   ================================================== */

SELECT
	OrderID,
	OrderDate,
	Sales,
	LAG(Sales) OVER(ORDER BY OrderDate, OrderID) AS PrevSale
FROM Sales.Orders;

/* ==================================================
   EXERCISE 202
   Topic: Sales difference

   TASK:
   Add a column showing the difference between current Sales and previous order Sales using LAG.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, OrderDate, Sales

   CONCEPTS:
   LAG and LEAD
   ================================================== */

SELECT
	OrderID,
	OrderDate,
	Sales,
	LAG(Sales) OVER(ORDER BY OrderDate, OrderID) AS PrevSale,
	Sales - LAG(Sales) OVER(ORDER BY OrderDate, OrderID) AS SaleDifference
FROM Sales.Orders;

/* ==================================================
   EXERCISE 203
   Topic: LEAD next order

   TASK:
   Display each order's OrderID, OrderDate, Sales, and the next row's Sales using LEAD.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, OrderDate, Sales

   CONCEPTS:
   LAG and LEAD
   ================================================== */

SELECT
	OrderID,
	OrderDate,
	Sales,
	LEAD(Sales) OVER(ORDER BY OrderDate, OrderID) AS NextSale
FROM Sales.Orders;

/* ==================================================
   EXERCISE 204
   Topic: Compare orders per customer

   TASK:
   Use LAG partitioned by CustomerID to compare each customer's current order Sales with their previous order Sales.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, CustomerID, OrderDate, Sales

   CONCEPTS:
   LAG and LEAD
   ================================================== */

SELECT
	OrderID,
	CustomerID,
	OrderDate,
	Sales,
	LAG(Sales) OVER(PARTITION BY CustomerID ORDER BY OrderDate, OrderID) AS PrevSale
FROM Sales.Orders;

/* ==================================================
   EXERCISE 205
   Topic: First and next order date

   TASK:
   For each customer's order, return the previous and next OrderDate using LAG and LEAD.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, CustomerID, OrderDate

   CONCEPTS:
   LAG and LEAD
   ================================================== */

SELECT
	OrderID,
	CustomerID,
	OrderDate,
	LAG(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate, OrderID) AS PrevOrder,
	LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate, OrderID) AS NextOrder
FROM Sales.Orders;

/* ==================================================
   EXERCISE 206
   Topic: Change from previous order

   TASK:
   For each customer, calculate the percentage change in Sales compared with their previous order. Use NULLIF to avoid division by zero.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, CustomerID, OrderDate, Sales

   CONCEPTS:
   LAG and LEAD
   ================================================== */

SELECT
    OrderID,
    CustomerID,
    OrderDate,
    Sales,
    PrevSales,
    ROUND(
        (CAST(Sales AS FLOAT) - PrevSales)
        / NULLIF(PrevSales, 0) * 100,
        2
    ) AS SalesChangePercentage
FROM (
    SELECT
        OrderID,
        CustomerID,
        OrderDate,
        Sales,
        LAG(Sales) OVER (
            PARTITION BY CustomerID
            ORDER BY OrderDate, OrderID
        ) AS PrevSales
    FROM Sales.Orders
) AS T;

/* ==================================================
   EXERCISE 207
   Topic: Compare employee salary sequence

   TASK:
   Order employees by Salary and use LAG/LEAD to show the adjacent salary values. Add EmployeeID as a tie-breaker.

   TABLES / COLUMNS:
   Sales.Employees: EmployeeID, Salary

   CONCEPTS:
   LAG and LEAD
   ================================================== */

SELECT
	EmployeeID,
	Salary,
	LAG(Salary) OVER(ORDER BY Salary, EmployeeID) AS PrevEmployeeSalary,
	LEAD(Salary) OVER(ORDER BY Salary, EmployeeID) AS NextEmployeeSalary
FROM Sales.Employees;

/* ==================================================
   EXERCISE 208
   Topic: Detect gaps between orders

   TASK:
   For each customer, return each order date and the previous order date. Calculate the number of days between them.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, CustomerID, OrderDate

   CONCEPTS:
   LAG and LEAD
   ================================================== */

SELECT
	OrderID,
	CustomerID,
	OrderDate,
	LAG(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate, OrderID) AS PrevOrderDate,
	DATEDIFF(DAY, LAG(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate, OrderID), OrderDate) AS DateDifference
FROM Sales.Orders;

/* ==================================================
   EXERCISE 209
   Topic: Status change context

   TASK:
   Order records by CreationTime and OrderID and use LAG to show the previous row's OrderStatus. This is a row-to-row comparison, not necessarily a status history for the same order.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, CreationTime, OrderStatus

   CONCEPTS:
   LAG and LEAD
   ================================================== */

SELECT
	OrderID,
	CreationTime,
	OrderStatus,
	LAG(OrderStatus) OVER(ORDER BY CreationTime, OrderID) AS PrevOrderStatus
FROM Sales.Orders;

/* ==================================================
   EXERCISE 210
   Topic: Combined LAG/LEAD analysis

   TASK:
   Return OrderID, OrderDate, Sales, previous Sales, next Sales, and the difference between current Sales and previous Sales. Use deterministic ordering.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, OrderDate, Sales

   CONCEPTS:
   LAG and LEAD
   ================================================== */

SELECT 
	OrderID,
	OrderDate,
	Sales,
	LAG(Sales) OVER(ORDER BY OrderDate,OrderID) AS PrevSales,
	LEAD(Sales) OVER(ORDER BY OrderDate,OrderID) AS NextSales,
	Sales - LAG(Sales) OVER(ORDER BY OrderDate,OrderID) AS CurrentSalesAndPrevSalesDifference
FROM Sales.Orders;

