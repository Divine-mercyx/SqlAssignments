1. SELECT * FROM CUSTOMER;
   SELECT * FROM INVOICE;
   SELECT * FROM INVOICE_ITEM;

2. select firstName, lastName, Phone from CUSTOMER;
3. select firstName, lastName, Phone from CUSTOMER where firstName = 'Nikki';
4. select C.lastName, C.firstName, C.Phone, I.DateIn, I.DateOut from CUSTOMER C JOIN INVOICE I ON C.CustomerID = I.CustomerID WHERE I.TotalAmount > 100.00;
5. select firstName, lastName, Phone from CUSTOMER where firstName like 'B%';
6. select lastName, firstName, Phone from CUSTOMER where lastName like '%cat%';
7. select lastName, firstName, Phone from CUSTOMER where Phone like '_23%';
8. select MAX(TotalAmount) as MaxTotalAMount, MIN(TotalAmount) as MinTotalAmount from INVOICE;
9. Select AVG(TotalAmount) as AverageTotalAmount from INVOICE;
10. select COUNT(*) NumberOfCustomers from CUSTOMER;
11. select firstName, lastName, COUNT(*) as Count from CUSTOMER GROUP BY lastName, firstName;
12. SELECT LastName, FirstName, Phone FROM CUSTOMER WHERE CustomerID IN (SELECT CustomerID FROM INVOICE WHERE TotalAmount > 100.00) ORDER BY LastName ASC, FirstName DESC;
13. SELECT C.LastName, C.FirstName, C.Phone FROM CUSTOMER C, INVOICE I WHERE C.CustomerID = I.CustomerID AND I.TotalAmount > 100.00 ORDER BY C.LastName ASC, C.FirstName DESC;
14. SELECT C.LastName, C.FirstName, C.Phone FROM CUSTOMER C JOIN INVOICE I ON C.CustomerID = I.CustomerID WHERE I.TotalAmount > 100.00 ORDER BY C.LastName ASC, C.FirstName DESC;

15. SELECT LastName, FirstName, Phone 
FROM CUSTOMER I
WHERE CustomerID IN (
    SELECT I.CustomerID 
    FROM INVOICE_ITEM I 
    WHERE I.Item = 'Dress Shirt'
)
ORDER BY LastName ASC, FirstName DESC;


16. SELECT C.LastName, C.FirstName, C.Phone 
FROM CUSTOMER C, INVOICE I, INVOICE_ITEM II 
WHERE C.CustomerID = I.CustomerID AND I.InvoiceNumber = II.InvoiceNumber AND II.Item = 'Dress Shirt' 
ORDER BY C.LastName ASC, C.FirstName DESC;

17. 
SELECT C.LastName AS CustomerLastName, C.FirstName AS CustomerFirstName, 
       R.LastName AS ReferredByLastName, R.FirstName AS ReferredByFirstName 
FROM CUSTOMER C 
LEFT JOIN CUSTOMER R ON C.ReferredBy = R.CustomerID;

18.
SELECT C.LastName, C.FirstName, C.Phone 
FROM CUSTOMER C 
JOIN INVOICE I ON C.CustomerID = I.CustomerID 
WHERE I.InvoiceNumber IN (
    SELECT InvoiceNumber 
    FROM INVOICE_ITEM 
    WHERE Item = 'Dress Shirt'
)
ORDER BY C.LastName ASC, C.FirstName DESC;

19.
SELECT C.LastName, C.FirstName, C.Phone, I.TotalAmount 
FROM CUSTOMER C 
JOIN INVOICE I ON C.CustomerID = I.CustomerID 
WHERE I.InvoiceNumber IN (
    SELECT InvoiceNumber 
    FROM INVOICE_ITEM 
    WHERE Item = 'Dress Shirt'
)
UNION 
SELECT C.LastName, C.FirstName, C.Phone, NULL AS TotalAmount 
FROM CUSTOMER C 
WHERE C.CustomerID NOT IN (
    SELECT CustomerID 
    FROM INVOICE I 
    JOIN INVOICE_ITEM II ON I.InvoiceNumber = II.InvoiceNumber 
    WHERE II.Item = 'Dress Shirt'
)
ORDER BY TotalAmount ASC, LastName ASC, FirstName DESC;

