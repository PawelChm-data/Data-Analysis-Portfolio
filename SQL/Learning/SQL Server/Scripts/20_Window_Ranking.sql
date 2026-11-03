/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 191–200
   TOPIC: Window Ranking Functions
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 191
   Topic: ROW_NUMBER

   TASK:
   Number orders from newest to oldest using ROW_NUMBER. Return OrderID, OrderDate, and row number.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, OrderDate

   CONCEPTS:
   Window Ranking Functions
   ================================================== */

SELECT
	OrderID,
	OrderDate,
	ROW_NUMBER() OVER (ORDER BY OrderDate DESC, OrderID DESC) AS RowNumber
FROM Sales.Orders;

/* ==================================================
   EXERCISE 192
   Topic: Rank customers by score

   TASK:
   Rank customers by Score descending using RANK. Return CustomerID, names, Score, and rank; decide how NULL scores should be handled.

   TABLES / COLUMNS:
   Sales.Customers: CustomerID, FirstName, LastName, Score

   CONCEPTS:
   Window Ranking Functions
   ================================================== */

SELECT 
	CustomerID,
	FirstName,
	ISNULL(LastName, 'N/A') AS LastName,
	ISNULL(Score, 0) AS Score,
	RANK() OVER (ORDER BY ISNULL(Score, 0) DESC) AS HighestRanking
FROM Sales.Customers;

/* ==================================================
   EXERCISE 193
   Topic: DENSE_RANK products

   TASK:
   Rank products by Price descending using DENSE_RANK. Return ProductID, Product, Category, Price, and rank.

   TABLES / COLUMNS:
   Sales.Products: ProductID, Product, Category, Price

   CONCEPTS:
   Window Ranking Functions
   ================================================== */

SELECT
	ProductID,
	Product,
	Category,
	Price,
	DENSE_RANK() OVER (ORDER BY Price DESC) AS PriceRanking
FROM Sales.Products;

/* ==================================================
   EXERCISE 194
   Topic: Rank within category

   TASK:
   Rank products by Price within each Category.

   TABLES / COLUMNS:
   Sales.Products: ProductID, Product, Category, Price

   CONCEPTS:
   Window Ranking Functions
   ================================================== */

SELECT
	ProductID,
	Product,
	Category,
	Price,
	DENSE_RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS HighestPrice
FROM Sales.Products;

/* ==================================================
   EXERCISE 195
   Topic: Top three products per category

   TASK:
   Use a CTE or subquery with a window ranking function to return the three most expensive products in each Category.

   TABLES / COLUMNS:
   Sales.Products: ProductID, Product, Category, Price

   CONCEPTS:
   Window Ranking Functions
   ================================================== */

SELECT
*
FROM (
SELECT
	ProductID,
	Product,
	Category,
	Price,
	RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS PriceRank
FROM Sales.Products) AS T
WHERE PriceRank <= 3
ORDER BY Category, Price DESC, ProductID;

/* ==================================================
   EXERCISE 196
   Topic: Rank employees by salary

   TASK:
   Rank employees by Salary within each Department. Return EmployeeID, names, Department, Salary, and rank.

   TABLES / COLUMNS:
   Sales.Employees: EmployeeID, FirstName, LastName, Department, Salary

   CONCEPTS:
   Window Ranking Functions
   ================================================== */

SELECT
	EmployeeID,
	FirstName,
	LastName,
	Department,
	Salary,
	RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS SalaryRank
FROM Sales.Employees;

/* ==================================================
   EXERCISE 197
   Topic: Top customer sales

   TASK:
   Aggregate Sales by CustomerID, then rank customers by total Sales. Return the five highest-ranked customers.

   TABLES / COLUMNS:
   Sales.Orders: CustomerID, Sales

   CONCEPTS:
   Window Ranking Functions
   ================================================== */

WITH CustomerSales AS (
    SELECT
        CustomerID,
        SUM(Sales) AS TotalSalesPerCustomer
    FROM Sales.Orders
    GROUP BY CustomerID
)
SELECT TOP 5
    CustomerID,
    TotalSalesPerCustomer,
    RANK() OVER (ORDER BY TotalSalesPerCustomer DESC) AS SalesRank
FROM CustomerSales
ORDER BY TotalSalesPerCustomer DESC;

/* ==================================================
   EXERCISE 198
   Topic: Order sequence per customer

   TASK:
   Assign a sequence number to each customer's orders ordered by OrderDate and OrderID.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, CustomerID, OrderDate

   CONCEPTS:
   Window Ranking Functions
   ================================================== */

SELECT
	OrderID,
	CustomerID,
	OrderDate,
	ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY OrderDate, OrderID) AS SequenceNumber
FROM Sales.Orders;

/* ==================================================
   EXERCISE 199
   Topic: Percent rank

   TASK:
   Calculate salary percentage across all employees. Return EmployeeID, Salary, and percentile rank.

   TABLES / COLUMNS:
   Sales.Employees: EmployeeID, Salary

   CONCEPTS:
   Window Ranking Functions
   ================================================== */

SELECT
    EmployeeID,
    Salary,
    PERCENT_RANK() OVER (
        ORDER BY Salary
    ) AS SalaryPercentRank
FROM Sales.Employees;

/* ==================================================
   EXERCISE 200
   Topic: NTILE salary groups

   TASK:
   Divide employees into four salary groups using NTILE(4). Return EmployeeID, names, Salary, and salary group.

   TABLES / COLUMNS:
   Sales.Employees: EmployeeID, FirstName, LastName, Salary

   CONCEPTS:
   Window Ranking Functions
   ================================================== */

SELECT 
	EmployeeID,
	FirstName,
	LastName,
	Salary,
	NTILE(4) OVER(ORDER BY Salary DESC, EmployeeID) AS SalaryGroup
FROM Sales.Employees;

