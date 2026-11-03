/* ==================================================
   SQL SERVER PRACTICE — EXERCISES 91–100
   TOPIC: STRING FUNCTIONS II
   DATABASE: SalesDB
   ================================================== */

/* ==================================================
   EXERCISE 91
   Topic: LEFT

   TASK:
   Extract the first 3 characters from each customer's
   FirstName.

   RETURN:
   - CustomerID
   - FirstName
   - First 3 characters of FirstName

   CONCEPTS:
   LEFT
   ================================================== */

select 
    CustomerID,
    FirstName,
    left(FirstName, 3)
from Sales.Customers;


/* ==================================================
   EXERCISE 92
   Topic: RIGHT

   TASK:
   Extract the last 3 characters from each customer's
   LastName.

   RETURN:
   - CustomerID
   - LastName
   - Last 3 characters of LastName

   CONCEPTS:
   RIGHT
   ================================================== */

select 
    CustomerID,
    LastName,
    right(LastName, 3)
from Sales.Customers;


/* ==================================================
   EXERCISE 93
   Topic: SUBSTRING

   TASK:
   Extract characters 2 through 5 from each customer's
   FirstName.

   RETURN:
   - CustomerID
   - FirstName
   - Extracted characters

   CONCEPTS:
   SUBSTRING
   ================================================== */

select 
    CustomerID,
    FirstName,
    substring(FirstName, 2, 4)
from Sales.Customers;


/* ==================================================
   EXERCISE 94
   Topic: String extraction

   TASK:
   Extract the first character from each customer's
   FirstName.

   RETURN:
   - CustomerID
   - FirstName
   - First character of FirstName

   CONCEPTS:
   LEFT
   ================================================== */

select 
    CustomerID,
    FirstName,
    left(FirstName, 1)
from Sales.Customers;


/* ==================================================
   EXERCISE 95
   Topic: String extraction

   TASK:
   Extract the last character from each customer's
   LastName.

   RETURN:
   - CustomerID
   - LastName
   - Last character of LastName

   CONCEPTS:
   RIGHT
   ================================================== */

select 
    CustomerID,
    LastName,
    right(LastName, 1)
from Sales.Customers;


/* ==================================================
   EXERCISE 96
   Topic: LEN + LEFT

   TASK:
   Return the first half of each customer's FirstName.
   Use LEN to determine the length of the name and
   LEFT to extract the first half.

   CONCEPTS:
   LEN
   LEFT
   ================================================== */

select 
    CustomerID,
    FirstName,
    len(FirstName) as FirstNameLength,
    left(FirstName, len(FirstName) / 2) as HalfFirstName
from Sales.Customers;


/* ==================================================
   EXERCISE 97
   Topic: LEN + SUBSTRING

   TASK:
   For each customer's LastName, use LEN and SUBSTRING
   to return all characters starting from the second
   character to the end of the name.

   RETURN:
   - CustomerID
   - LastName
   - Extracted text

   CONCEPTS:
   LEN
   SUBSTRING
   ================================================== */

select 
    CustomerID,
    LastName,
    len(LastName) as LastNameLength,
    substring(LastName, 2, len(LastName)) as LastNameFromSecondChar
from Sales.Customers;


/* ==================================================
   EXERCISE 98
   Topic: String cleaning

   TASK:
   For each customer's FirstName:
   - Remove leading and trailing spaces.
   - Convert the result to uppercase.
   - Replace every occurrence of the letter 'A'
   with '@'.

   RETURN:
   - CustomerID
   - Original FirstName
   - Cleaned FirstName

   CONCEPTS:
   TRIM
   UPPER
   REPLACE
   Nested functions
   ================================================== */

select 
    CustomerID,
    FirstName,
    replace(upper(trim(FirstName)), 'a', '@') as CleanedFirstName
from Sales.Customers;


/* ==================================================
   EXERCISE 99
   Topic: Multiple string functions

   TASK:
   Create a FullName column by combining each
   customer's FirstName and LastName with a space.
   Then return the number of characters in the
   resulting FullName.

   RETURN:
   - CustomerID
   - FullName
   - FullName character count

   CONCEPTS:
   CONCAT
   LEN
   ================================================== */

select 
    CustomerID,
    FirstName,
    LastName,
    concat(FirstName, ' ', LastName) as FullName,
    len(concat(FirstName, ' ', LastName)) as FullNameLength
from Sales.Customers;


/* ==================================================
   EXERCISE 100
   Topic: String challenge

   TASK:
   Create a CustomerIdentifier for each customer
   using the first character of FirstName, the first
   character of LastName and CustomerID.
   The identifier should follow this structure:
   FirstInitial + LastInitial + CustomerID
   Example:
   John Smith, CustomerID 123 → JS123
   Convert CustomerID to a text value if necessary.

   RETURN:
   - CustomerID
   - FirstName
   - LastName
   - CustomerIdentifier

   CONCEPTS:
   LEFT
   CONCAT
   CAST / conversion
   ================================================== */

select 
    CustomerID,
    FirstName,
    LastName,
    concat(left(FirstName, 1), left(LastName, 1), cast(CustomerID as varchar(20))) as CustomerIdentifier
from Sales.Customers;