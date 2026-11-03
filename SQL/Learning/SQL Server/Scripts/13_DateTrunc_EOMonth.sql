/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 121–130
   TOPIC: DATETRUNC / EOMONTH
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 121
   Topic: DATETRUNC year

   TASK:
   Truncate CreationTime to the beginning of its
   year.

   RETURN:
   - OrderID
   - CreationTime
   - Beginning of the year

   CONCEPTS:
   DATETRUNC
   YEAR
   ================================================== */

select
	OrderID,
	CreationTime,
	datetrunc(year, CreationTime) as BeginningOfYear
from Sales.Orders;


/* ==================================================
   EXERCISE 122
   Topic: DATETRUNC quarter

   TASK:
   Truncate CreationTime to the beginning of its
   quarter.

   RETURN:
   - OrderID
   - CreationTime
   - Beginning of the quarter

   CONCEPTS:
   DATETRUNC
   QUARTER
   ================================================== */

select
	OrderID,
	CreationTime,
	datetrunc(quarter, CreationTime) as BeginningOfQuarter
from Sales.Orders;


/* ==================================================
   EXERCISE 123
   Topic: DATETRUNC month

   TASK:
   Truncate CreationTime to the beginning of its
   month.

   RETURN:
   - OrderID
   - CreationTime
   - Beginning of the month

   CONCEPTS:
   DATETRUNC
   MONTH
   ================================================== */

select
	OrderID,
	CreationTime,
	datetrunc(month, CreationTime) as BeginningOfMonth
from Sales.Orders;


/* ==================================================
   EXERCISE 124
   Topic: DATETRUNC day

   TASK:
   Truncate CreationTime to the beginning of its
   day.

   RETURN:
   - OrderID
   - CreationTime
   - Beginning of the day

   CONCEPTS:
   DATETRUNC
   DAY
   ================================================== */

select
	OrderID,
	CreationTime,
	datetrunc(day, CreationTime) as BeginningOfDay
from Sales.Orders;


/* ==================================================
   EXERCISE 125
   Topic: DATETRUNC hour

   TASK:
   Truncate CreationTime to the beginning of its
   hour.

   RETURN:
   - OrderID
   - CreationTime
   - Beginning of the hour

   CONCEPTS:
   DATETRUNC
   HOUR
   ================================================== */

select
	OrderID,
	CreationTime,
	datetrunc(hour, CreationTime) as BeginningOfHour
from Sales.Orders;


/* ==================================================
   EXERCISE 126
   Topic: DATETRUNC comparison

   TASK:
   Display CreationTime together with:
   - the beginning of its month
   - the beginning of its day

   CONCEPTS:
   DATETRUNC
   MONTH
   DAY
   ================================================== */

select
	OrderID,
	CreationTime,
	datetrunc(month, CreationTime) as BeginningOfMonth,
	datetrunc(day, CreationTime) as BeginningOfDay
from Sales.Orders;


/* ==================================================
   EXERCISE 127
   Topic: EOMONTH

   TASK:
   Return the last day of the month for each
   OrderDate.

   RETURN:
   - OrderID
   - OrderDate
   - Last day of the month

   CONCEPTS:
   EOMONTH
   ================================================== */

select
	OrderID,
	OrderDate,
	eomonth(OrderDate) as LastDayOfMonth
from Sales.Orders;


/* ==================================================
   EXERCISE 128
   Topic: EOMONTH with offset

   TASK:
   Return the last day of the month following
   each OrderDate.

   RETURN:
   - OrderID
   - OrderDate
   - Last day of the following month

   CONCEPTS:
   EOMONTH
   Date offset
   ================================================== */

select
	OrderID,
	OrderDate,
	eomonth(OrderDate, 1) as LastDayOfFollowingMonth
from Sales.Orders;


/* ==================================================
   EXERCISE 129
   Topic: EOMONTH comparison

   TASK:
   Display each OrderDate together with:
   - the first day of its month
   - the last day of its month

   CONCEPTS:
   DATETRUNC
   EOMONTH
   MONTH
   ================================================== */

select
	OrderID,
	OrderDate,
	datetrunc(month, OrderDate) as FirstDayOfMonth,
	eomonth(OrderDate) as LastDayOfMonth
from Sales.Orders;


/* ==================================================
   EXERCISE 130
   Topic: Date granularity

   TASK:
   Display CreationTime together with:
   - the beginning of its year
   - the beginning of its month
   - the beginning of its day
   - the last day of its month

   CONCEPTS:
   DATETRUNC
   EOMONTH
   YEAR
   MONTH
   DAY
   ================================================== */

select
	OrderID,
	CreationTime,
	datetrunc(year, CreationTime) as BeginningOfYear,
	datetrunc(month, CreationTime) as BeginningOfMonth,
	datetrunc(day, CreationTime) as BeginningOfDay,
	eomonth(CreationTime) as LastDayOfMonth
from Sales.Orders;