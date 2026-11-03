/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 151–160
   TOPIC: CASE Expressions
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 151
   Topic: Simple CASE

   TASK:
   Display OrderID, OrderStatus, and a new StatusDescription column. Use CASE to map the actual OrderStatus values in the table to readable descriptions. Include an ELSE value for unexpected statuses.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, OrderStatus

   CONCEPTS:
   CASE Expressions
   ================================================== */

SELECT
    OrderID,
    OrderStatus,
    CASE
        WHEN OrderStatus = 'Shipped' THEN 'Shipped'
        WHEN OrderStatus = 'Delivered' THEN 'Delivered'
        ELSE 'Other / Unknown'
    END AS StatusDescription
FROM Sales.Orders;

/* ==================================================
   EXERCISE 152
   Topic: CASE with numeric ranges

   TASK:
   Display ProductID, Product, Price, and a PriceBand column. Classify products into three price bands using thresholds you choose and document in a comment.

   TABLES / COLUMNS:
   Sales.Products: ProductID, Product, Price

   CONCEPTS:
   CASE Expressions
   ================================================== */

SELECT
	ProductID,
	Product,
	Price,
	CASE
        WHEN Price IS NULL THEN 'Unknown Price'
		WHEN Price < 15 THEN 'Budget'
		WHEN Price BETWEEN 15 AND 25 THEN 'Mid-Range'
		ELSE 'Premium'
	END AS PriceBand
FROM Sales.Products;

/* ==================================================
   EXERCISE 153
   Topic: CASE with multiple conditions

   TASK:
   Display EmployeeID, FirstName, LastName, Salary, and a SalaryBand. Use at least three salary bands and handle NULL salary explicitly.

   TABLES / COLUMNS:
   Sales.Employees: EmployeeID, FirstName, LastName, Salary

   CONCEPTS:
   CASE Expressions
   ================================================== */

SELECT
	EmployeeID,
	FirstName,
	COALESCE(LastName, 'N/A') AS LastName,
	Salary,
	CASE
		WHEN Salary IS NULL THEN 'Unknown Salary'
        WHEN Salary < 65000 THEN 'Low Salary'
		WHEN Salary BETWEEN 65000 AND 75000 THEN 'Mid-Range Salary'
		ELSE 'High Salary'
	END AS SalaryBand
FROM Sales.Employees;

/* ==================================================
   EXERCISE 154
   Topic: CASE with dates

   TASK:
   Complete the exercise using the specified concepts.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, OrderDate, ShipDate

   CONCEPTS:
   CASE Expressions
   ================================================== */

SELECT
    OrderID,
    OrderDate,
    ShipDate,
    DATEDIFF(DAY, OrderDate, ShipDate) AS Difference_In_Days,
    CASE
        WHEN OrderDate IS NULL OR ShipDate IS NULL THEN 'Unknown'
        WHEN DATEDIFF(DAY, OrderDate, ShipDate) < 5 THEN 'Fast Delivery'
        WHEN DATEDIFF(DAY, OrderDate, ShipDate) <= 10 THEN 'Regular Delivery'
        ELSE 'Slow Delivery'
    END AS ShippingStatus
FROM Sales.Orders;

/* ==================================================
   EXERCISE 155
   Topic: CASE with text values

   TASK:
   Display EmployeeID, FirstName, LastName, Gender, and a normalized GenderDescription using CASE. Include a fallback for NULL or unexpected values.

   TABLES / COLUMNS:
   Sales.Employees: EmployeeID, FirstName, LastName, Gender

   CONCEPTS:
   CASE Expressions
   ================================================== */

SELECT 
	EmployeeID,
	FirstName,
	COALESCE(LastName, 'N/A') AS LastName,
	Gender,
	CASE
		WHEN Gender = 'M' THEN 'Male'
		WHEN Gender = 'F' THEN 'Female'
		ELSE 'Unknown'
	END AS GenderDescription
FROM Sales.Employees;

/* ==================================================
   EXERCISE 156
   Topic: CASE in ORDER BY

   TASK:
   Return OrderID, OrderStatus, Sales. Sort the results by status priority using a CASE expression in ORDER BY, then by Sales descending. Choose and document a priority order.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, OrderStatus, Sales

   CONCEPTS:
   CASE Expressions
   ================================================== */

SELECT
	OrderID,
	OrderStatus,
	Sales,
	    CASE
			WHEN OrderStatus = 'Shipped' THEN 1
			WHEN OrderStatus = 'Delivered' THEN 2
        ELSE 3
    END AS Priority_Number
FROM Sales.Orders
ORDER BY
Priority_Number,
Sales DESC;


/* ==================================================
   EXERCISE 157
   Topic: CASE with calculated value

   TASK:
   Display OrderID, Quantity, Sales, and a calculated Incentive column. Use CASE to calculate an incentive only when Sales and Quantity meet conditions you define.

   TABLES / COLUMNS:
   Sales.Orders: OrderID, Quantity, Sales

   CONCEPTS:
   CASE Expressions
   ================================================== */

SELECT
    OrderID,
    Quantity,
    Sales,
    CASE
        WHEN Sales IS NULL OR Quantity IS NULL THEN NULL
        WHEN Sales >= 50 AND Quantity >= 2
            THEN CAST(Sales * 0.05 AS DECIMAL(10, 2))
        ELSE CAST(0 AS DECIMAL(10, 2))
    END AS Incentive
FROM Sales.Orders;

/* ==================================================
   EXERCISE 158
   Topic: CASE with aggregation

   TASK:
   Count orders by a status priority group you create with CASE. Return one row per group and the number of orders.

   TABLES / COLUMNS:
   Sales.Orders: OrderStatus

   CONCEPTS:
   CASE Expressions
   ================================================== */

SELECT
    CASE
        WHEN OrderStatus = 'Shipped' THEN 'Shipped'
        WHEN OrderStatus = 'Delivered' THEN 'Delivered'
        ELSE 'Other / Unknown'
    END AS Status_Priority,
    COUNT(*) AS Total_Orders
FROM Sales.Orders
GROUP BY
    CASE
        WHEN OrderStatus = 'Shipped' THEN 'Shipped'
        WHEN OrderStatus = 'Delivered' THEN 'Delivered'
        ELSE 'Other / Unknown'
    END
ORDER BY Status_Priority;

/* ==================================================
   EXERCISE 159
   Topic: Conditional SUM

   TASK:
   Return total Sales for orders that meet a condition you choose, plus total Sales for all other orders. Use SUM with CASE and give both columns clear aliases.

   TABLES / COLUMNS:
   Sales.Orders: Sales, OrderStatus

   CONCEPTS:
   CASE Expressions
   ================================================== */

SELECT
    SUM(
        CASE
            WHEN OrderStatus = 'Shipped' THEN Sales
            ELSE 0
        END
    ) AS Shipped_Sales,
    SUM(
        CASE
            WHEN OrderStatus <> 'Shipped'
                 OR OrderStatus IS NULL
                THEN Sales
            ELSE 0
        END
    ) AS Other_Sales
FROM Sales.Orders;

/* ==================================================
   EXERCISE 160
   Topic: Combined CASE analysis

   TASK:
   Create a summary by customer Country showing customer count and a count of customers whose Score is at or above a threshold you choose. Use conditional aggregation and handle NULL Score values correctly.

   TABLES / COLUMNS:
   Sales.Customers: Country, CustomerID, Score

   CONCEPTS:
   CASE Expressions
   ================================================== */

SELECT
    Country,
    COUNT(*) AS Total_Customers,
    SUM(
        CASE
            WHEN COALESCE(Score, 0) >= 400 THEN 1
            ELSE 0
        END
    ) AS Customers_Score_400_Or_Above
FROM Sales.Customers
GROUP BY Country
ORDER BY Country;