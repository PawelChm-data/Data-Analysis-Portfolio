/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 141–150
   TOPIC: CONVERT / CAST
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 141
   Topic: CONVERT basic casting

   TASK:
   Convert the Sales column from Sales.Orders
   into VARCHAR.

   RETURN:
   - OrderID
   - Sales
   - Sales converted to VARCHAR

   CONCEPTS:
   CONVERT
   Data type conversion
   ================================================== */

select
	OrderID,
	Sales,
	convert(varchar(20), Sales) as SalesVarchar
from Sales.Orders;


/* ==================================================
   EXERCISE 142
   Topic: CONVERT string to integer

   TASK:
   Convert the string value '123' into an INT.
   Return the converted value as a single result.

   CONCEPTS:
   CONVERT
   INT
   VARCHAR
   ================================================== */

select
	'123' as StringValue,
	convert(int, '123') as IntValue;


/* ==================================================
   EXERCISE 143
   Topic: CONVERT datetime to date

   TASK:
   Convert CreationTime from DATETIME2 to DATE.

   RETURN:
   - OrderID
   - CreationTime
   - CreationTime converted to DATE

   CONCEPTS:
   CONVERT
   DATE
   DATETIME2
   ================================================== */

select
	OrderID,
	CreationTime,
	convert(date, CreationTime) as CreationDate
from Sales.Orders;


/* ==================================================
   EXERCISE 144
   Topic: CONVERT with style

   TASK:
   Convert CreationTime to VARCHAR using
   date style 103 (British/French date format).

   RETURN:
   - OrderID
   - CreationTime
   - Formatted CreationTime

   CONCEPTS:
   CONVERT
   Style
   Date formatting
   ================================================== */

select
	OrderID,
	CreationTime,
	convert(varchar(10), CreationTime, 103) as FormattedCreationTime
from Sales.Orders;


/* ==================================================
   EXERCISE 145
   Topic: CONVERT date style

   TASK:
   Convert CreationTime to VARCHAR using
   date style 101 (U.S. date format).

   RETURN:
   - OrderID
   - CreationTime
   - Formatted CreationTime
   Compare the result with the format used
   in Exercise 144.

   CONCEPTS:
   CONVERT
   Style numbers
   Date formatting
   ================================================== */

select
	OrderID,
	CreationTime,
	convert(varchar(10), CreationTime, 101) as FormattedCreationTime
from Sales.Orders;


/* ==================================================
   EXERCISE 146
   Topic: CAST string to integer

   TASK:
   Convert the string value '123' into an INT
   using CAST.
   Return the converted value as a single result.

   CONCEPTS:
   CAST
   AS
   ================================================== */

select
	'123' as StringValue,
	cast('123' as int) as IntValue;


/* ==================================================
   EXERCISE 147
   Topic: CAST integer to string

   TASK:
   Convert CustomerID from Sales.Customers
   into VARCHAR using CAST.

   RETURN:
   - CustomerID
   - CustomerID converted to VARCHAR

   CONCEPTS:
   CAST
   VARCHAR
   ================================================== */

select
	CustomerID,
	cast(CustomerID as varchar(20)) as CustomerIDVarchar
from Sales.Customers;


/* ==================================================
   EXERCISE 148
   Topic: CAST string to date

   TASK:
   Convert the string value '2025-01-01'
   into the DATE data type using CAST.
   Return the converted value as a single result.

   CONCEPTS:
   CAST
   DATE
   ================================================== */

select
	'2025-01-01' as StringValue,
	cast('2025-01-01' as date) as DateValue;


/* ==================================================
   EXERCISE 149
   Topic: CAST datetime to date

   TASK:
   Convert CreationTime into DATE using CAST,
   removing the time component from the result.

   RETURN:
   - OrderID
   - CreationTime
   - CreationTime converted to DATE

   CONCEPTS:
   CAST
   DATE
   DATETIME2
   ================================================== */

select
	OrderID,
	CreationTime,
	cast(CreationTime as date) as CreationDate
from Sales.Orders;


/* ==================================================
   EXERCISE 150
   Topic: FORMAT vs CONVERT vs CAST

   TASK:
   Using CreationTime, create three separate
   outputs:
   1. Format CreationTime as a readable date.
   2. Convert CreationTime to DATE.
   3. Cast CreationTime to DATE.

   RETURN:
   - OrderID
   - CreationTime
   - Formatted date
   - Converted date
   - Cast date
   Compare the three results and identify which
   operation changes the appearance and which
   operations change the data type.

   CONCEPTS:
   FORMAT
   CONVERT
   CAST
   Data type vs formatting
   ================================================== */

select
	OrderID,
	CreationTime,
	format(CreationTime, 'g') as FormattedDate,
	convert(date, CreationTime) as ConvertedDate,
	cast(CreationTime as date) as CastDate
from Sales.Orders;