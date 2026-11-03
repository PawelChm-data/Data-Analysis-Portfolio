/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 111–120
   TOPIC: DATEPART / DATENAME
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 111
   Topic: DATEPART year

   TASK:
   Extract the year from OrderDate using DATEPART.

   RETURN:
   - OrderID
   - OrderDate
   - Year

   CONCEPTS:
   DATEPART
   YEAR
   ================================================== */

select
	OrderID,
	OrderDate,
	datepart(year, OrderDate) as Year
from Sales.Orders;


/* ==================================================
   EXERCISE 112
   Topic: DATEPART month

   TASK:
   Extract the month number from OrderDate using
   DATEPART.

   RETURN:
   - OrderID
   - OrderDate
   - Month number

   CONCEPTS:
   DATEPART
   MONTH
   ================================================== */

select
	OrderID,
	OrderDate,
	datepart(month, OrderDate) as MonthNumber
from Sales.Orders;


/* ==================================================
   EXERCISE 113
   Topic: DATEPART day

   TASK:
   Extract the day of the month from OrderDate
   using DATEPART.

   RETURN:
   - OrderID
   - OrderDate
   - Day of the month

   CONCEPTS:
   DATEPART
   DAY
   ================================================== */

select
	OrderID,
	OrderDate,
	datepart(day, OrderDate) as Day
from Sales.Orders;


/* ==================================================
   EXERCISE 114
   Topic: DATEPART quarter

   TASK:
   Extract the quarter number from OrderDate.
   The result should be a number from 1 to 4.

   RETURN:
   - OrderID
   - OrderDate
   - Quarter number

   CONCEPTS:
   DATEPART
   QUARTER
   ================================================== */

select
	OrderID,
	OrderDate,
	datepart(quarter, OrderDate) as Quarter
from Sales.Orders;


/* ==================================================
   EXERCISE 115
   Topic: DATEPART week

   TASK:
   Extract the week number of the year from
   OrderDate.

   RETURN:
   - OrderID
   - OrderDate
   - Week number

   CONCEPTS:
   DATEPART
   WEEK
   ================================================== */

select
	OrderID,
	OrderDate,
	datepart(week, OrderDate) as WeekNumber
from Sales.Orders;


/* ==================================================
   EXERCISE 116
   Topic: DATEPART weekday

   TASK:
   Extract the weekday number from OrderDate.

   RETURN:
   - OrderID
   - OrderDate
   - Weekday number

   CONCEPTS:
   DATEPART
   WEEKDAY
   ================================================== */

select
	OrderID,
	OrderDate,
	datepart(weekday, OrderDate) as WeekdayNumber
from Sales.Orders;


/* ==================================================
   EXERCISE 117
   Topic: DATENAME month

   TASK:
   Return the month name from OrderDate as text.

   RETURN:
   - OrderID
   - OrderDate
   - Month name

   CONCEPTS:
   DATENAME
   MONTH
   ================================================== */

select
	OrderID,
	OrderDate,
	datename(month, OrderDate) as MonthName
from Sales.Orders;


/* ==================================================
   EXERCISE 118
   Topic: DATENAME weekday

   TASK:
   Return the weekday name from OrderDate as text.

   RETURN:
   - OrderID
   - OrderDate
   - Weekday name

   CONCEPTS:
   DATENAME
   WEEKDAY
   ================================================== */

select
	OrderID,
	OrderDate,
	datename(weekday, OrderDate) as WeekdayName
from Sales.Orders;


/* ==================================================
   EXERCISE 119
   Topic: DATEPART + DATENAME

   TASK:
   Display OrderDate together with:
   - the month number
   - the month name
   Use DATEPART to return the month number
   and DATENAME to return the month name.

   CONCEPTS:
   DATEPART
   DATENAME
   MONTH
   ================================================== */

select
	OrderID,
	OrderDate,
	datepart(month, OrderDate) as MonthNumber,
	datename(month, OrderDate) as MonthName
from Sales.Orders;


/* ==================================================
   EXERCISE 120
   Topic: Date analysis

   TASK:
   Display the following information for each order:
   - OrderID
   - OrderDate
   - Year
   - Quarter number
   - Month number
   - Month name
   Use DATEPART for the numeric date parts
   and DATENAME for the month name.

   CONCEPTS:
   DATEPART
   DATENAME
   YEAR
   QUARTER
   MONTH
   ================================================== */

select
	OrderID,
	OrderDate,
	datepart(year, OrderDate) as Year,
	datepart(quarter, OrderDate) as Quarter,
	datepart(month, OrderDate) as MonthNumber,
	datename(month, OrderDate) as MonthName
from Sales.Orders;