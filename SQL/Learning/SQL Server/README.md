# SQL Server Practice Exercises (01–230)

A collection of **230 SQL practice exercises** organized into 23 `.sql` files.
The exercises use the **SalesDB** sample database and cover SQL Server querying
from basic `SELECT` statements through subqueries and common table expressions.

The scripts are intended for practice in **Microsoft SQL Server / SSMS**.
Each file contains task descriptions and SQL examples or solutions.

## Exercise files

| File | Exercises | Main topics |
|---|---:|---|
| `01_Select_Basics(1).sql` | 01–10 | SELECT, column selection, aliases, calculated columns, DISTINCT |
| `02_Aggregate Functions(1).sql` | 11–20 | COUNT, SUM, AVG, MIN, MAX and aggregate functions |
| `03_Group By_Having(1).sql` | 21–30 | GROUP BY, HAVING and grouped aggregations |
| `04_Filtering(1).sql` | 31–40 | Filtering rows with WHERE and comparison operators |
| `05_Between_In_Like(1).sql` | 41–50 | BETWEEN, IN, LIKE |
| `06_Join_Basics(1).sql` | 51–60 | INNER JOIN and basic table relationships |
| `07_Outer_Joins(1).sql` | 61–70 | LEFT, RIGHT and FULL OUTER JOIN |
| `08_Set_Operators(1).sql` | 71–80 | UNION, UNION ALL and set operators |
| `09_String_Manipulation(1).sql` | 81–90 | String functions and manipulation |
| `10_String_Calculation & Extraction(1).sql` | 91–100 | String calculations, extraction and concatenation |
| `11_DateTime_Basics(1).sql` | 101–110 | Date and time operations |
| `12_DatePart_DateName(1).sql` | 111–120 | DATEPART, DATENAME and date components |
| `13_DateTrunc_EOMonth(1).sql` | 121–130 | Date truncation and end-of-month calculations |
| `14_Format(1).sql` | 131–140 | FORMAT and output formatting |
| `15_Cast_Convert(1).sql` | 141–150 | CAST, CONVERT and data type conversion |
| `16_CASE_Expressions.sql` | 151–160 | CASE expressions and conditional logic |
| `17_NULL_Handling.sql` | 161–170 | IS NULL, ISNULL, COALESCE, NULLIF and NULL handling |
| `18_Conditional_Aggregation.sql` | 171–180 | Conditional aggregation with CASE |
| `19_Window_Aggregates.sql` | 181–190 | Window aggregates, running totals and moving averages |
| `20_Window_Ranking.sql` | 191–200 | ROW_NUMBER, RANK, DENSE_RANK, PERCENT_RANK and NTILE |
| `21_LAG_LEAD.sql` | 201–210 | LAG, LEAD and row-to-row comparisons |
| `22_CTEs.sql` | 211–220 | Common Table Expressions (CTEs) |
| `23_Subqueries.sql` | 221–230 | Scalar, correlated and multi-level subqueries |

## SalesDB database

The exercises use the `Sales` schema. The main tables and columns are:

### `Sales.Customers`
- `CustomerID` — customer identifier
- `FirstName`, `LastName` — customer name
- `Country` — customer country
- `Score` — customer score; may contain `NULL`

### `Sales.Employees`
- `EmployeeID` — employee identifier
- `FirstName`, `LastName` — employee name
- `Department` — department
- `BirthDate` — date of birth
- `Gender` — gender value
- `Salary` — employee salary
- `ManagerID` — manager identifier; may contain `NULL`

### `Sales.Orders`
- `OrderID` — order identifier
- `ProductID` — related product
- `CustomerID` — related customer
- `SalesPersonID` — salesperson identifier
- `OrderDate`, `ShipDate` — order and shipping dates
- `OrderStatus` — order status
- `ShipAddress`, `BillAddress` — shipping and billing addresses
- `Quantity` — ordered quantity
- `Sales` — sales amount
- `CreationTime` — record creation timestamp

### `Sales.Products`
- `ProductID` — product identifier
- `Product` — product name
- `Category` — product category
- `Price` — product price

Other supporting tables may also exist in the database, but the exercises primarily use the four tables listed above.

## How to use

1. Open the relevant `.sql` file in SQL Server Management Studio.
2. Select `SalesDB` as the active database (or execute `USE SalesDB;` if appropriate).
3. Run the exercises individually or section by section.
4. Review the task comments and compare your query with the expected result.

## Notes

- These exercises are for learning and portfolio practice.
- Thresholds and sample business rules may be selected as part of an exercise.
- `NULL` values are intentional in several exercises and should be handled explicitly where required.
- Window-function results depend on the `ORDER BY` and window frame specified.
