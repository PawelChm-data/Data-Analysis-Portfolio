/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 101–110
   TOPIC: DATE & TIME BASICS
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 101
   Topic: Date and time columns

   TASK:
   Display the following columns from Sales.Orders:
   - OrderID
   - OrderDate
   - ShipDate
   - CreationTime

   CONCEPTS:
   DATE
   DATETIME2
   ================================================== */

select
	OrderID,
	OrderDate,
	ShipDate,
	CreationTime
from Sales.Orders;


/* ==================================================
   EXERCISE 102
   Topic: Current date and time

   TASK:
   Return the current system date and time of
   the SQL Server.
   Return the result as a single value.

   CONCEPTS:
   GETDATE
   ================================================== */

select getdate() as CurrentDateTime;


/* ==================================================
   EXERCISE 103
   Topic: Hard-coded date

   TASK:
   Add the hard-coded date '2025-01-01' to the
   SELECT statement and display it for every order.

   RETURN:
   - OrderID
   - Hard-coded date

   CONCEPTS:
   Date literals
   ================================================== */

select
	OrderID,
	'2025-01-01' as HardCodedDate
from Sales.Orders;


/* ==================================================
   EXERCISE 104
   Topic: GETDATE with Orders

   TASK:
   Display each OrderID together with the current
   system date and time.

   RETURN:
   - OrderID
   - Current date and time

   CONCEPTS:
   GETDATE
   ================================================== */

select
	OrderID,
	getdate() as CurrentDateTime
from Sales.Orders;


/* ==================================================
   EXERCISE 105
   Topic: DAY

   TASK:
   Extract the day of the month from OrderDate
   for each order.

   RETURN:
   - OrderID
   - OrderDate
   - Day of the month

   CONCEPTS:
   DAY
   ================================================== */

select
	OrderID,
	OrderDate,
	day(OrderDate) as DayOfTheMonth
from Sales.Orders;


/* ==================================================
   EXERCISE 106
   Topic: MONTH

   TASK:
   Extract the month from OrderDate
   for each order.

   RETURN:
   - OrderID
   - OrderDate
   - Month

   CONCEPTS:
   MONTH
   ================================================== */

select
	OrderID,
	OrderDate,
	month(OrderDate) as MonthOfOrder
from Sales.Orders;


/* ==================================================
   EXERCISE 107
   Topic: YEAR

   TASK:
   Extract the year from OrderDate
   for each order.

   RETURN:
   - OrderID
   - OrderDate
   - Year

   CONCEPTS:
   YEAR
   ================================================== */

select
	OrderID,
	OrderDate,
	year(OrderDate) as YearOfOrder
from Sales.Orders;


/* ==================================================
   EXERCISE 108
   Topic: Date parts

   TASK:
   Display each order's OrderDate together with
   its day, month and year.

   RETURN:
   - OrderID
   - OrderDate
   - Day
   - Month
   - Year

   CONCEPTS:
   DAY
   MONTH
   YEAR
   ================================================== */

select
	OrderID,
	OrderDate,
	day(OrderDate) as DayOfOrder,
	month(OrderDate) as MonthOfOrder,
	year(OrderDate) as YearOfOrder
from Sales.Orders;


/* ==================================================
   EXERCISE 109
   Topic: CreationTime

   TASK:
   Extract the year, month and day from CreationTime
   for each order.

   RETURN:
   - OrderID
   - CreationTime
   - Year
   - Month
   - Day

   CONCEPTS:
   DAY
   MONTH
   YEAR
   DATETIME2
   ================================================== */

select
	OrderID,
	CreationTime,
	day(CreationTime) as DayCreationTime,
	month(CreationTime) as MonthCreationTime,
	year(CreationTime) as YearCreationTime
from Sales.Orders;


/* ==================================================
   EXERCISE 110
   Topic: Date analysis

   TASK:
   Display each employee's BirthDate together with
   the year, month and day of birth.

   RETURN:
   - EmployeeID
   - BirthDate
   - Birth year
   - Birth month
   - Birth day

   CONCEPTS:
   DAY
   MONTH
   YEAR
   DATE
   ================================================== */

select
	EmployeeID,
	BirthDate,
	day(BirthDate) as DayBirthDate,
	month(BirthDate) as MonthBirthDate,
	year(BirthDate) as YearBirthDate
from Sales.Employees;