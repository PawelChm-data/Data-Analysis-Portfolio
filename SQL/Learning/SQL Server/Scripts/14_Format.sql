/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 131–140
   TOPIC: FORMAT
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 131
   Topic: FORMAT date

   TASK:
   Format CreationTime so that the result displays
   the date in the following format:
   DD/MM/YYYY

   RETURN:
   - OrderID
   - CreationTime
   - Formatted date

   CONCEPTS:
   FORMAT
   Date formatting
   ================================================== */

select
	OrderID,
	CreationTime,
	format(CreationTime, 'dd/MM/yyyy') as FormattedDate
from Sales.Orders;


/* ==================================================
   EXERCISE 132
   Topic: FORMAT year and month

   TASK:
   Format CreationTime so that the result displays
   only the month and year in the following format:
   MM/YYYY

   RETURN:
   - OrderID
   - CreationTime
   - Formatted month and year

   CONCEPTS:
   FORMAT
   ================================================== */

select
	OrderID,
	CreationTime,
	format(CreationTime, 'MM/yyyy') as FormattedDate
from Sales.Orders;


/* ==================================================
   EXERCISE 133
   Topic: FORMAT month name

   TASK:
   Format CreationTime so that the result displays
   the full month name followed by the year.
   Example:
   September 2026

   RETURN:
   - OrderID
   - CreationTime
   - Formatted month and year

   CONCEPTS:
   FORMAT
   Date format specifiers
   ================================================== */

select
	OrderID,
	CreationTime,
	format(CreationTime, 'MMMM yyyy') as FormattedDate
from Sales.Orders;


/* ==================================================
   EXERCISE 134
   Topic: FORMAT short month

   TASK:
   Format CreationTime so that the result displays
   an abbreviated month name followed by the year.
   Example:
   Sep 2026

   RETURN:
   - OrderID
   - CreationTime
   - Formatted month and year

   CONCEPTS:
   FORMAT
   ================================================== */

select
	OrderID,
	CreationTime,
	format(CreationTime, 'MMM yyyy') as FormattedDate
from Sales.Orders;


/* ==================================================
   EXERCISE 135
   Topic: FORMAT time

   TASK:
   Format CreationTime so that only the time is
   displayed in the following format:
   HH:MM:SS

   RETURN:
   - OrderID
   - CreationTime
   - Formatted time

   CONCEPTS:
   FORMAT
   Time formatting
   ================================================== */

select
	OrderID,
	CreationTime,
	format(CreationTime, 'HH:mm:ss') as FormattedTime
from Sales.Orders;


/* ==================================================
   EXERCISE 136
   Topic: FORMAT number

   TASK:
   Format Sales using a numeric format that includes
   thousands separators and displays two decimal places.

   RETURN:
   - OrderID
   - Sales
   - Formatted Sales

   CONCEPTS:
   FORMAT
   Numeric formatting
   ================================================== */

select
	OrderID,
	Sales,
	format(Sales, 'N2') as FormattedSales
from Sales.Orders;


/* ==================================================
   EXERCISE 137
   Topic: FORMAT currency

   TASK:
   Format Sales as a currency value using a standard
   currency format.

   RETURN:
   - OrderID
   - Sales
   - Formatted Sales

   CONCEPTS:
   FORMAT
   Currency format
   ================================================== */

select
	OrderID,
	Sales,
	format(Sales, 'C', 'en-US') as FormattedSales
from Sales.Orders;


/* ==================================================
   EXERCISE 138
   Topic: FORMAT percentage

   TASK:
   Calculate a 10% increase of Sales and format
   the increase rate as a percentage.

   RETURN:
   - OrderID
   - Sales
   - Increase rate as a percentage
   The percentage should be displayed as:
   10%

   CONCEPTS:
   FORMAT
   Percentage format
   Calculated values
   ================================================== */

select
	OrderID,
	Sales,
	format(0.10, 'P0') as IncreaseRate
from Sales.Orders;


/* ==================================================
   EXERCISE 139
   Topic: FORMAT multiple columns

   TASK:
   Display OrderID and CreationTime together with
   CreationTime formatted as:
   DD/MM/YYYY HH:MM

   RETURN:
   - OrderID
   - CreationTime
   - Formatted CreationTime

   CONCEPTS:
   FORMAT
   Date formatting
   ================================================== */

select
	OrderID,
	CreationTime,
	format(CreationTime, 'dd/MM/yyyy HH:mm') as FormattedCreationTime
from Sales.Orders;


/* ==================================================
   EXERCISE 140
   Topic: FORMAT with culture

   TASK:
   Format CreationTime as a date using the
   Polish culture/locale and compare the result
   with formatting using the US English culture/locale.

   RETURN:
   - OrderID
   - CreationTime
   - Polish formatted date
   - US English formatted date

   CONCEPTS:
   FORMAT
   Culture
   Locale
   ================================================== */

select
	OrderID,
	CreationTime,
	format(CreationTime, 'g', 'pl-PL') as PolishFormattedDate,
	format(CreationTime, 'g', 'en-US') as USFormattedDate
from Sales.Orders;