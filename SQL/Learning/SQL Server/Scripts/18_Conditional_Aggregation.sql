/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 171–180
   TOPIC: Conditional Aggregation
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 171
   Topic: Count with CASE

   TASK:
   Return the total number of orders and the number of orders with a non-NULL ShipDate in one row.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, ShipDate

   CONCEPTS:
   Conditional Aggregation
   ================================================== */

SELECT
    COUNT(*) AS TotalOrders,
    COUNT(CASE
        WHEN ShipDate IS NOT NULL THEN 1
    END) AS TotalOrdersWithNonNullShipDate
FROM Sales.Orders;

/* ==================================================
   EXERCISE 172
   Topic: Count by order status

   TASK:
   Return total orders and a separate count for each OrderStatus value using SUM(CASE...).

   TABLES / COLUMNS:
   Sales.Orders: OrderID, OrderStatus

   CONCEPTS:
   Conditional Aggregation
   ================================================== */

SELECT
    COUNT(*) AS TotalOrders,
    SUM(CASE
        WHEN OrderStatus = 'Delivered' THEN 1
        ELSE 0
    END) AS DeliveredOrders,
    SUM(CASE
        WHEN OrderStatus = 'Shipped' THEN 1
        ELSE 0
    END) AS ShippedOrders,
    SUM(CASE
        WHEN OrderStatus IS NULL THEN 1
        ELSE 0
    END) AS OrdersWithUnknownStatus
FROM Sales.Orders;

/* ==================================================
   EXERCISE 173
   Topic: Sales by status

   TASK:
   Return total Sales for each OrderStatus using conditional aggregation. Produce one row with separate columns for statuses present in the data.

   TABLES / COLUMNS:
   Sales.Orders: Sales, OrderStatus

   CONCEPTS:
   Conditional Aggregation
   ================================================== */

SELECT
    SUM(CASE
        WHEN OrderStatus = 'Delivered' THEN Sales
        ELSE 0
    END) AS DeliveredSales,
    SUM(CASE
        WHEN OrderStatus = 'Shipped' THEN Sales
        ELSE 0
    END) AS ShippedSales,
    SUM(CASE
        WHEN OrderStatus IS NULL THEN Sales
        ELSE 0
    END) AS SalesWithUnknownStatus,
    SUM(Sales) AS TotalSales
FROM Sales.Orders;

/* ==================================================
   EXERCISE 174
   Topic: Score bands

   TASK:
   Group customers by Country and return customer counts for at least two Score bands using SUM(CASE...).

   TABLES / COLUMNS:
   Sales.Customers: Country, CustomerID, Score

   CONCEPTS:
   Conditional Aggregation
   ================================================== */

SELECT
    Country,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN Score < 400 THEN 1
        ELSE 0
    END) AS CustomersBelow400,
    SUM(CASE
        WHEN Score >= 400 AND Score <= 700 THEN 1
        ELSE 0
    END) AS CustomersWithScore400To700,
    SUM(CASE
        WHEN Score > 700 THEN 1
        ELSE 0
    END) AS CustomersAbove700,
    SUM(CASE
        WHEN Score IS NULL THEN 1
        ELSE 0
    END) AS CustomersWithoutScore
FROM Sales.Customers
GROUP BY Country
ORDER BY Country;
/* ==================================================
   EXERCISE 175
   Topic: Gender counts

   TASK:
   Return employee counts by Department with separate counts for each Gender value using conditional aggregation. Include NULL Gender in a separate count.

   TABLES / COLUMNS:
   Sales.Employees: Department, Gender, EmployeeID

   CONCEPTS:
   Conditional Aggregation
   ================================================== */

SELECT
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(CASE
        WHEN Gender = 'M' THEN 1
        ELSE 0
    END) AS MaleEmployees,
    SUM(CASE
        WHEN Gender = 'F' THEN 1
        ELSE 0
    END) AS FemaleEmployees,
    SUM(CASE
        WHEN Gender IS NULL THEN 1
        ELSE 0
    END) AS EmployeesWithUnknownGender
FROM Sales.Employees
GROUP BY Department
ORDER BY Department;

/* ==================================================
   EXERCISE 176
   Topic: Sales above threshold

   TASK:
   Return total order count, count of orders above a Sales threshold you choose, and total Sales for those orders, all in one row.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, Sales

   CONCEPTS:
   Conditional Aggregation
   ================================================== */

SELECT
    COUNT(*) AS TotalOrders,
    SUM(CASE
        WHEN Sales > 50 THEN 1
        ELSE 0
    END) AS OrdersAbove50,
    SUM(CASE
        WHEN Sales > 50 THEN Sales
        ELSE 0
    END) AS TotalSalesAbove50
FROM Sales.Orders;

/* ==================================================
   EXERCISE 177
   Topic: Shipping analysis

   TASK:
   Return total orders, shipped orders, and orders with no ShipDate by OrderStatus.

   TABLES / COLUMNS:
   Sales.Orders: OrderStatus, OrderID, ShipDate

   CONCEPTS:
   Conditional Aggregation
   ================================================== */

SELECT
    OrderStatus,
    COUNT(*) AS TotalOrders,
    SUM(CASE
        WHEN ShipDate IS NOT NULL THEN 1
        ELSE 0
    END) AS OrdersWithShipDate,
    SUM(CASE
        WHEN ShipDate IS NULL THEN 1
        ELSE 0
    END) AS OrdersWithoutShipDate
FROM Sales.Orders
GROUP BY OrderStatus
ORDER BY OrderStatus;

/* ==================================================
   EXERCISE 178
   Topic: Country customer profile

   TASK:
   For each Country, return total customers, customers with Score >= a chosen threshold, and customers with missing Score.

   TABLES / COLUMNS:
   Sales.Customers: Country, CustomerID, Score

   CONCEPTS:
   Conditional Aggregation
   ================================================== */

SELECT
    Country,
    COUNT(*) AS TotalCustomers,
    SUM(CASE
        WHEN Score >= 500 THEN 1
        ELSE 0
    END) AS CustomersWithScoreAtLeast500,
    SUM(CASE
        WHEN Score IS NULL THEN 1
        ELSE 0
    END) AS CustomersWithoutScore
FROM Sales.Customers
GROUP BY Country
ORDER BY Country;

/* ==================================================
   EXERCISE 179
   Topic: Product price summary

   TASK:
   Return total products, products above a price threshold, and products with missing Price by Category.

   TABLES / COLUMNS:
   Sales.Products: ProductID, Category, Price

   CONCEPTS:
   Conditional Aggregation
   ================================================== */

SELECT
    Category,
    COUNT(*) AS TotalProducts,
    SUM(CASE
        WHEN Price > 15 THEN 1
        ELSE 0
    END) AS ProductsAbove15,
    SUM(CASE
        WHEN Price IS NULL THEN 1
        ELSE 0
    END) AS ProductsWithoutPrice
FROM Sales.Products
GROUP BY Category
ORDER BY Category;

/* ==================================================
   EXERCISE 180
   Topic: Multi-metric employee summary

   TASK:
   Return one row per Department with employee count, employees with known Salary, and total Salary for employees whose Salary exceeds a threshold you choose.

   TABLES / COLUMNS:
   Sales.Employees: Department, EmployeeID, Salary

   CONCEPTS:
   Conditional Aggregation
   ================================================== */

-- Write your query below:

SELECT
    Department,
    COUNT(*) AS TotalEmployees,
    COUNT(Salary) AS EmployeesWithKnownSalary,
    SUM(CASE
        WHEN Salary > 5000 THEN Salary
        ELSE 0
    END) AS TotalSalaryAbove5000
FROM Sales.Employees
GROUP BY Department
ORDER BY Department;