/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 161–170
   TOPIC: NULL Handling
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 161
   Topic: IS NULL

   TASK:
   Find employees whose Department is NULL. Return EmployeeID, FirstName, LastName, and Department.

   TABLES / COLUMNS:
   Sales.Employees: EmployeeID, FirstName, LastName, Department

   CONCEPTS:
   NULL Handling
   ================================================== */

SELECT
	EmployeeID,
	FirstName,
	LastName,
	Department
FROM Sales.Employees
WHERE Department IS NULL;

/* ==================================================
   EXERCISE 162
   Topic: IS NOT NULL

   TASK:
   List customers with a known Score. Return CustomerID, FirstName, LastName, and Score.

   TABLES / COLUMNS:
   Sales.Customers: CustomerID, FirstName, LastName, Score

   CONCEPTS:
   NULL Handling
   ================================================== */

SELECT
	CustomerID,
	FirstName,
	LastName,
	Score
FROM Sales.Customers
WHERE Score IS NOT NULL;

/* ==================================================
   EXERCISE 163
   Topic: COALESCE

   TASK:
   Display EmployeeID, names, and Department, replacing a NULL Department with 'Unassigned' using COALESCE.

   TABLES / COLUMNS:
   Sales.Employees: EmployeeID, FirstName, LastName, Department

   CONCEPTS:
   NULL Handling
   ================================================== */

SELECT
	EmployeeID,
	FirstName,
	LastName,
	COALESCE(Department, 'Unassigned') AS Department
FROM Sales.Employees;

/* ==================================================
   EXERCISE 164
   Topic: ISNULL

   TASK:
   Display CustomerID, names, and Score. Replace a NULL Score with 0 using ISNULL.

   TABLES / COLUMNS:
   Sales.Customers: CustomerID, FirstName, LastName, Score

   CONCEPTS:
   NULL Handling
   ================================================== */

SELECT
	CustomerID,
	CONCAT(FirstName, ' ', COALESCE(LastName, 'N/A')) AS FullName,
	ISNULL(Score, 0) AS Score
FROM Sales.Customers

/* ==================================================
   EXERCISE 165
   Topic: NULLIF

   TASK:
   Display OrderID, Quantity, Sales, and SalesPerUnit. Calculate Sales / Quantity safely using NULLIF to prevent division by zero.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, Quantity, Sales

   CONCEPTS:
   NULL Handling
   ================================================== */

SELECT
	OrderID,
	Quantity,
	Sales,
	Sales / NULLIF(Quantity, 0) AS SalesPerUnit
FROM Sales.Orders;

/* ==================================================
   EXERCISE 166
   Topic: NULL in arithmetic

   TASK:
   Return OrderID, Sales, Quantity, and a calculated value that uses both Sales and Quantity. Explain in a comment how NULL values affect the result.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, Sales, Quantity

   CONCEPTS:
   NULL Handling
   ================================================== */

SELECT
    OrderID,
    Sales,
    Quantity,
    CAST(Sales AS FLOAT) / NULLIF(Quantity, 0) AS SalesPerUnit
FROM Sales.Orders;

/* ==================================================
   EXERCISE 167
   Topic: Compare NULL strategies

   TASK:
   Return ManagerID, ManagerID count, and a count of employees with a known ManagerID.

   TABLES / COLUMNS:
   Sales.Employees: ManagerID

   CONCEPTS:
   NULL Handling
   ================================================== */

SELECT
    ManagerID,
    COUNT(*) AS TotalEmployeesInGroup,
    COUNT(ManagerID) AS EmployeesWithKnownManagerID
FROM Sales.Employees
GROUP BY ManagerID;

/* ==================================================
   EXERCISE 168
   Topic: COALESCE with addresses

   TASK:
   Display OrderID and a single PreferredAddress column. Use COALESCE to return ShipAddress first, then BillAddress, and finally 'Address unavailable'.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, ShipAddress, BillAddress

   CONCEPTS:
   NULL Handling
   ================================================== */

SELECT
	OrderID,
	ShipAddress,
	BillAddress,
	COALESCE(ShipAddress, BillAddress, 'Address unavailable') AS PreferredAddress
FROM Sales.Orders;

/* ==================================================
   EXERCISE 169
   Topic: NULL-aware filtering

   TASK:
   Find orders where either ShipDate or OrderDate is missing. Return OrderID, OrderDate, and ShipDate.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, OrderDate, ShipDate

   CONCEPTS:
   NULL Handling
   ================================================== */

SELECT
    OrderID,
    OrderDate,
    ShipDate
FROM Sales.Orders
WHERE OrderDate IS NULL OR ShipDate IS NULL;

/* ==================================================
   EXERCISE 170
   Topic: NULL-aware summary

   TASK:
   Summarize customers by Country, returning total customers, customers with a Score, and customers without a Score. Use conditional aggregation or COUNT appropriately.

   TABLES / COLUMNS:
   Sales.Customers: Country, CustomerID, Score

   CONCEPTS:
   NULL Handling
   ================================================== */

SELECT
    Country,
    COUNT(*) AS TotalCustomers,
    COUNT(Score) AS CustomersWithScore,
    COUNT(*) - COUNT(Score) AS CustomersWithoutScore
FROM Sales.Customers
GROUP BY Country
ORDER BY Country;

