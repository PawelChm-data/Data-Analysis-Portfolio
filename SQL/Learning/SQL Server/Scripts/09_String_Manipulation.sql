/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 81–90
   TOPIC: STRING FUNCTIONS / MANIPULATION
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 81
   Topic: UPPER

   TASK:
   Display the FirstName of each customer in
   uppercase.

   RETURN:
   - CustomerID
   - FirstName in uppercase

   CONCEPTS:
   UPPER
   ================================================== */

select
	CustomerID,
	upper(FirstName)
from Sales.Customers;


/* ==================================================
   EXERCISE 82
   Topic: LOWER

   TASK:
   Display the LastName of each customer in
   lowercase.

   RETURN:
   - CustomerID
   - LastName in lowercase

   CONCEPTS:
   LOWER
   ================================================== */

select
	CustomerID,
	lower(LastName)
from Sales.Customers;


/* ==================================================
   EXERCISE 83
   Topic: CONCAT

   TASK:
   Combine FirstName and LastName of each customer
   into a single column called FullName.

   CONCEPTS:
   CONCAT
   ================================================== */

select
	CustomerID,
	concat(FirstName, LastName) as FullName
from Sales.Customers;


/* ==================================================
   EXERCISE 84
   Topic: CONCAT with separator

   TASK:
   Create a FullName column by combining
   FirstName and LastName with a space between them.

   CONCEPTS:
   CONCAT
   String literals
   ================================================== */

select
	CustomerID,
	concat(FirstName, ' ', LastName) as FullName
from Sales.Customers;


/* ==================================================
   EXERCISE 85
   Topic: CONCAT_WS

   TASK:
   Create a PersonInfo column by combining
   FirstName, LastName and Country using a space
   as the separator.
   The result should follow this format:
   FirstName LastName Country

   CONCEPTS:
   CONCAT_WS
   String separators
   ================================================== */

select
	CustomerID,
	concat_ws(' ', FirstName, LastName, Country) as PersonInfo
from Sales.Customers;


/* ==================================================
   EXERCISE 86
   Topic: TRIM

   TASK:
   Display each customer's FirstName after removing
   any leading and trailing spaces.

   RETURN:
   - CustomerID
   - Original FirstName
   - Trimmed FirstName

   CONCEPTS:
   TRIM
   ================================================== */

select 
	CustomerID,
	FirstName,
	trim(FirstName)
from Sales.Customers;
	

/* ==================================================
   EXERCISE 87
   Topic: LTRIM

   TASK:
   Display each customer's LastName after removing
   any leading spaces.

   RETURN:
   - CustomerID
   - Original LastName
   - Trimmed LastName

   CONCEPTS:
   LTRIM
   ================================================== */

select 
	CustomerID,
	LastName,
	ltrim(LastName)
from Sales.Customers;


/* ==================================================
   EXERCISE 88
   Topic: RTRIM

   TASK:
   Display each customer's FirstName after removing
   any trailing spaces.

   RETURN:
   - CustomerID
   - Original FirstName
   - Trimmed FirstName

   CONCEPTS:
   RTRIM
   ================================================== */

select 
	CustomerID,
	FirstName,
	rtrim(FirstName)
from Sales.Customers;


/* ==================================================
   EXERCISE 89
   Topic: REPLACE

   TASK:
   Display each customer's FirstName and replace
   every occurrence of the letter 'a' with '@'.

   RETURN:
   - CustomerID
   - Original FirstName
   - Modified FirstName

   CONCEPTS:
   REPLACE
   ================================================== */

select 
	CustomerID,
	FirstName,
	replace(FirstName, 'a', '@')
from Sales.Customers;


/* ==================================================
   EXERCISE 90
   Topic: Nested string functions

   TASK:
   Create a FullName column by combining the customer's
   FirstName and LastName.
   Before combining the values:
   - Remove leading and trailing spaces from both names.
   - Convert the final FullName to uppercase.

   CONCEPTS:
   CONCAT
   UPPER
   TRIM
   Nested functions
   ================================================== */

select 
	CustomerID,
	upper(trim(concat(FirstName, ' ', LastName))) as FullName
from Sales.Customers;

