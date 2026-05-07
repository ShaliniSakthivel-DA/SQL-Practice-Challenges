
-- ==========================================================
-- Sales Analytics SQL Practice Project
-- File Name  : Sales_Analytics_Joins_Functions.sql
-- ==========================================================

USE Sales_Analytics;

-- 1.	List all orders along with the customer names.
SELECT 
	c.CustomerName AS customer_name,
    o.orderID,
    o.orderDate
FROM customers c
INNER JOIN orders o ON
	c.customerID = o.customerID
    
-- Show all customers and their orders using LEFT JOIN.

SELECT 
	c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.OrderDate
FROM customers c
LEFT JOIN orders o ON
	c.CustomerID = o.CustomerID; 
    
-- 3. Show salesperson name and orders assigned to them (RIGHT JOIN).

SELECT 
	s.salespersonID,
    s.salespersonName,
    o.OrderID
FROM salespersons s
RIGHT JOIN   orders o   ON 
	s.SalespersonID = o.SalespersonID

-- 4. List all orders with Customer Name, Product Name, Quantity, and Order Date (ordered by OrderID).

SELECT o.OrderID, c.CustomerName, p.ProductName, o.Quantity, o.OrderDate
FROM orders o
INNER JOIN customers c ON 
	o.CustomerID = c.CustomerID
INNER JOIN products p ON
	o.ProductID = p.ProductID
ORDER BY OrderID

-- 5. Display all orders from ‘Chennai’ customers with the product details.

SELECT 
	o.OrderID,
    c.CustomerName,
    c.City,
    p.ProductName,
    o.Quantity,
    o.OrderDate
FROM orders o
INNER JOIN customers c ON  o.CustomerID = c.CustomerID
INNER JOIN products p ON  o.ProductID = p.ProductID
WHERE c.city = "Chennai"

-- 6. Display all customers who purchased “Laptop”

SELECT c.CustomerID, c.CustomerName, ProductName
FROM customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN Products p ON o.ProductID = p.ProductID
WHERE p.ProductName = 'Laptop';

-- BUILT-IN FUNCTIONS + AGGREGATION
-- 7. Show total sales amount (Price × Quantity) for each order.

SELECT 
	o.OrderID,
    (p.Price*o.Quantity) AS TotalSales
FROM orders o
INNER JOIN Products p ON o.ProductID = p.ProductID; 

-- 8. Find the top 5 customers by total purchase amount.

SELECT 
	c.CustomerID,
    c.CustomerName,
     SUM(p.Price * o.Quantity) AS TotalPurchase
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Products p ON o.ProductID = p.ProductID
GROUP BY  c.CustomerID, c.CustomerName
ORDER BY TotalPurchase DESC
LIMIT 5;

-- 9. Show each Salesperson’s region and the total sales value.

SELECT 
    s.SalespersonName,
    s.Region,
    SUM(p.Price * o.Quantity) AS TotalSales
FROM Orders o
INNER JOIN Salespersons s ON o.SalespersonID = s.SalespersonID
INNER JOIN Products p ON o.ProductID = p.ProductID
GROUP BY s.SalespersonName, s.Region;

-- 10. Find the most sold product with total quantity.

SELECT 
	p.ProductName,
    SUM(o.quantity) AS TotalQuantity
FROM orders o
INNER JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantity DESC
LIMIT 1;

-- 11. Show the earliest (minimum) and latest (maximum) order date.

SELECT 
    MIN(OrderDate) AS FirstOrderDate,
    MAX(OrderDate) AS LastOrderDate
FROM Orders;

-- 12. Orders placed in January 2025

SELECT *
FROM Orders
WHERE MONTH(OrderDate) = 1
AND YEAR(OrderDate) = 2025;

-- 13. List orders week-wise (show week number and total orders).
SELECT WEEK(OrderDate) AS WeekNumber,
       COUNT(*) AS TotalOrders
FROM Orders
GROUP BY WEEK(OrderDate)
ORDER BY WeekNumber;

-- 14. Display orders along with the day name (Monday, Tuesday, etc.).

SELECT OrderID,
       OrderDate,
       DAYNAME(OrderDate) AS DayName
FROM Orders;

-- 15. Extract day name and display total sales amount and quantity per day of week (ordered Monday → Sunday).
SELECT 
    WeekDay,
    SUM(TotalSales) AS TotalSales,
    SUM(TotalQuantity) AS TotalQuantity
FROM (
    SELECT 
        DAYNAME(o.OrderDate) AS WeekDay,
        (p.Price * o.Quantity) AS TotalSales,
        o.Quantity AS TotalQuantity
    FROM Orders o
    INNER JOIN Products p 
        ON o.ProductID = p.ProductID
) AS sub
GROUP BY WeekDay
ORDER BY FIELD(WeekDay,
    'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');