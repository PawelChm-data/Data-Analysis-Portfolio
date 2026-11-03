/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 221–230
   TOPIC: Subqueries
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 221
   Topic: Scalar subquery

   TASK:
   Return products whose Price is greater than the overall average product Price using a scalar subquery.

   TABLES / COLUMNS:
   Sales.Products: ProductID, Product, Category, Price

   CONCEPTS:
   Subqueries
   ================================================== */

SELECT
    ProductID,
    Product,
    Category,
    Price
FROM Sales.Products
WHERE Price > (
    SELECT AVG(Price)
    FROM Sales.Products);

/* ==================================================
   EXERCISE 222
   Topic: Subquery with IN

   TASK:
   Find customers who have placed at least one order using IN and a subquery against Sales.Orders.

   TABLES / COLUMNS:
   Sales.Customers: CustomerID, FirstName, LastName; Sales.Orders: CustomerID

   CONCEPTS:
   Subqueries
   ================================================== */

SELECT
	CustomerID,
	FirstName,
	LastName
FROM Sales.Customers
WHERE CustomerID IN (SELECT CustomerID FROM Sales.Orders);

/* ==================================================
   EXERCISE 223
   Topic: Subquery with NOT IN

   TASK:
   Find customers who have no matching order using NOT EXISTS or NOT IN. If you use NOT IN, ensure the subquery cannot return NULL.

   TABLES / COLUMNS:
   Sales.Customers: CustomerID, FirstName, LastName; Sales.Orders: CustomerID

   CONCEPTS:
   Subqueries
   ================================================== */

SELECT
	CustomerID,
	FirstName,
	LastName
FROM Sales.Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Sales.Orders WHERE CustomerID IS NOT NULL);

/* ==================================================
   EXERCISE 224
   Topic: Correlated EXISTS

   TASK:
   Return customers for whom EXISTS finds an order with Sales above a threshold you choose.

   TABLES / COLUMNS:
   Sales.Customers: CustomerID, FirstName, LastName; Sales.Orders: CustomerID, Sales

   CONCEPTS:
   Subqueries
   ================================================== */

SELECT
	C.CustomerID,
	C.FirstName,
	C.LastName
FROM Sales.Customers AS C
WHERE EXISTS (SELECT O.CustomerID, O.Sales FROM Sales.Orders AS O WHERE C.CustomerID = O.CustomerID AND Sales >= 60);

/* ==================================================
   EXERCISE 225
   Topic: Correlated NOT EXISTS

   TASK:
   Return products for which no order line exists in Sales.Orders. Use NOT EXISTS.

   TABLES / COLUMNS:
   Sales.Products: ProductID, Product; Sales.Orders: ProductID

   CONCEPTS:
   Subqueries
   ================================================== */

SELECT
	P.ProductID,
	P.Product
FROM Sales.Products AS P
WHERE NOT EXISTS (SELECT P.ProductID FROM Sales.Orders AS O WHERE P.ProductID = O.ProductID);

/* ==================================================
   EXERCISE 226
   Topic: Subquery in SELECT

   TASK:
   Display each product with its Price and the overall average product Price as a scalar subquery column.

   TABLES / COLUMNS:
   Sales.Products: ProductID, Product, Price

   CONCEPTS:
   Subqueries
   ================================================== */

SELECT
	ProductID,
	Product,
	Price,
	(SELECT AVG(Price) FROM Sales.Products) AS AvgPrice
FROM Sales.Products;

/* ==================================================
   EXERCISE 227
   Topic: Subquery in FROM

   TASK:
   Create a derived table that calculates total Sales per CustomerID, then return only customers whose total exceeds a threshold you choose. Give the derived table an alias.

   TABLES / COLUMNS:
   Sales.Orders: CustomerID, Sales

   CONCEPTS:
   Subqueries
   ================================================== */

SELECT
	CustomerID,
	TotalSales
FROM (
	SELECT
		CustomerID,
		SUM(Sales) AS TotalSales
    FROM Sales.Orders
    GROUP BY CustomerID
) AS CustomerSales
WHERE TotalSales > 100
ORDER BY TotalSales DESC;

/* ==================================================
   EXERCISE 228
   Topic: Compare to department average

   TASK:
   Use a correlated subquery to return employees whose Salary is greater than the average Salary in their own Department. Handle NULL Department values deliberately.

   TABLES / COLUMNS:
   Sales.Employees: EmployeeID, FirstName, Department, Salary

   CONCEPTS:
   Subqueries
   ================================================== */

SELECT
    E.EmployeeID,
    E.FirstName,
    E.Department,
    E.Salary
FROM Sales.Employees AS E
WHERE E.Salary > (
    SELECT AVG(E2.Salary)
    FROM Sales.Employees AS E2
    WHERE E2.Department = E.Department
       OR (E2.Department IS NULL AND E.Department IS NULL)
);

/* ==================================================
   EXERCISE 229
   Topic: Top customer using subquery

   TASK:
   Find the customer or customers whose total Sales equals the maximum total Sales across customers. Use a subquery rather than TOP.

   TABLES / COLUMNS:
   Sales.Orders: CustomerID, Sales

   CONCEPTS:
   Subqueries
   ================================================== */

SELECT
    CustomerID,
    SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY CustomerID
HAVING SUM(Sales) = (
    SELECT MAX(CustomerTotals.TotalSales)
    FROM (
        SELECT
            CustomerID,
            SUM(Sales) AS TotalSales
        FROM Sales.Orders
        GROUP BY CustomerID
    ) AS CustomerTotals
);

/* ==================================================
   EXERCISE 230
   Topic: Multi-level subquery

   TASK:
   Find products whose Price is above the average Price of products in their own Category. Use a correlated subquery and return ProductID, Product, Category, and Price.

   TABLES / COLUMNS:
   Sales.Products: ProductID, Product, Category, Price

   CONCEPTS:
   Subqueries
   ================================================== */

SELECT
    P.ProductID,
    P.Product,
    P.Category,
    P.Price
FROM Sales.Products AS P
WHERE P.Price > (
    SELECT AVG(P2.Price)
    FROM Sales.Products AS P2
    WHERE P2.Category = P.Category
       OR (P2.Category IS NULL AND P.Category IS NULL)
);