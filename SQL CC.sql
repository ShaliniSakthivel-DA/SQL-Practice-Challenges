-- =====================================================
-- File Name : 03_SQL_Clauses_Operators.sql
-- Database  : Sales_Analytics
-- Author    : Shalini
-- Description:
-- This file contains SQL practice queries covering:
-- SELECT, DISTINCT, ALIAS, WHERE, IN, NOT IN,
-- ORDER BY, LIMIT, GROUP BY, HAVING,
-- and Aggregate Functions.
-- =====================================================

-- Create Database
CREATE DATABASE Sales_Analytics;
USE Sales_Analytics;

-----------------------------------------------------
-- 1. CUSTOMERS TABLE (30 CUSTOMERS)
-----------------------------------------------------
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    Gender VARCHAR(10),
    City VARCHAR(50),
    Email VARCHAR(100)
);

INSERT INTO Customers (CustomerName, Gender, City, Email) VALUES
('Arjun Kumar', 'Male', 'Chennai', 'arjun@gmail.com'),
('Priya Sharma', 'Female', 'Bangalore', 'priya@gmail.com'),
('John Mathew', 'Male', 'Mumbai', 'john@gmail.com'),
('Sneha Reddy', 'Female', 'Hyderabad', 'sneha@gmail.com'),
('Vikram Iyer', 'Male', 'Chennai', 'vikram@gmail.com'),
('Lakshmi Devi', 'Female', 'Coimbatore', 'lakshmi@gmail.com'),
('Rahul Verma', 'Male', 'Delhi', 'rahul@gmail.com'),
('Nisha Patel', 'Female', 'Ahmedabad', 'nisha@gmail.com'),
('Krishna Rao', 'Male', 'Hyderabad', 'krishna@gmail.com'),
('Ananya Gupta', 'Female', 'Pune', 'ananya@gmail.com'),
('Suresh Kumar', 'Male', 'Chennai', 'suresh@gmail.com'),
('Swati Singh', 'Female', 'Lucknow', 'swati@gmail.com'),
('Karan Malhotra', 'Male', 'Noida', 'karan@gmail.com'),
('Divya Menon', 'Female', 'Kochi', 'divya@gmail.com'),
('Amit Shah', 'Male', 'Surat', 'amit@gmail.com'),
('Pooja Mehta', 'Female', 'Mumbai', 'pooja@gmail.com'),
('Rajesh Nair', 'Male', 'Kerala', 'rajesh@gmail.com'),
('Harini Mohan', 'Female', 'Chennai', 'harini@gmail.com'),
('Rohit Singh', 'Male', 'Kanpur', 'rohit@gmail.com'),
('Meena Kumari', 'Female', 'Patna', 'meena@gmail.com'),
('Aditya Rao', 'Male', 'Hyderabad', 'aditya@gmail.com'),
('Neha Gupta', 'Female', 'Indore', 'neha@gmail.com'),
('Sameer Khan', 'Male', 'Bangalore', 'sameer@gmail.com'),
('Bhavana R', 'Female', 'Mysore', 'bhavana@gmail.com'),
('Raj Kumar', 'Male', 'Chennai', 'raj@gmail.com'),
('Sangeetha', 'Female', 'Bangalore', 'sangeetha@gmail.com'),
('Aravind', 'Male', 'Hyderabad', 'aravind@gmail.com'),
('Snehal', 'Female', 'Pune', 'snehal@gmail.com'),
('Joseph', 'Male', 'Kochi', 'joseph@gmail.com'),
('Maya', 'Female', 'Delhi', 'maya@gmail.com');

-----------------------------------------------------
-- 2. PRODUCTS TABLE
-----------------------------------------------------
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products (ProductName, Category, Price) VALUES
('Laptop', 'Electronics', 55000),
('Headphones', 'Electronics', 2500),
('Office Chair', 'Furniture', 9000),
('Keyboard', 'Electronics', 1500),
('Mouse', 'Electronics', 800),
('Monitor', 'Electronics', 12000);
INSERT INTO Products (ProductName, Category, Price) VALUES
('Webcam', 'Electronics', 3000),
('Tablet', 'Electronics', 20000),
('Desk Lamp', 'Furniture', 1500),
('Standing Desk', 'Furniture', 18000),
('Bluetooth Speaker', 'Electronics', 3500),
('USB Hub', 'Electronics', 700),
('Printer', 'Electronics', 8500),
('Pen Drive 64GB', 'Electronics', 600),
('Router', 'Electronics', 2500);

-----------------------------------------------------
-- 3. SALESPERSON TABLE
-----------------------------------------------------
CREATE TABLE Salespersons (
    SalespersonID INT PRIMARY KEY AUTO_INCREMENT,
    SalespersonName VARCHAR(100),
    Region VARCHAR(50),
    TargetAmount DECIMAL(10,2)
);

INSERT INTO Salespersons (SalespersonName, Region, TargetAmount) VALUES
('Meera', 'South', 300000),
('Rahul', 'North', 250000),
('Karthik', 'West', 200000),
('Neha', 'East', 180000);

-----------------------------------------------------
-- 4.ORDERS TABLE 
-----------------------------------------------------
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    SalespersonID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (SalespersonID) REFERENCES Salespersons(SalespersonID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Sample Order Data
INSERT INTO Orders (CustomerID, SalespersonID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 1, 1, '2025-01-10'),   -- laptop
(2, 2, 3, 1, '2025-01-11'),   -- chair
(3, 1, 4, 3, '2025-01-12'),   -- keyboard
(4, 3, 1, 1, '2025-01-14'),   -- laptop
(5, 4, 2, 2, '2025-01-15'),   -- headphones
(6, 2, 6, 1, '2025-01-16'),   -- monitor
(1, 1, 2, 1, '2025-01-17'),   -- headphones
(3, 4, 5, 2, '2025-01-18'),   -- mouse
(2, 3, 1, 1, '2025-01-19'),   -- laptop
(4, 2, 3, 4, '2025-01-20'),   -- chairs
(5, 1, 6, 2, '2025-01-21'),   -- monitors
(6, 3, 4, 1, '2025-01-22'),   -- keyboard
(1, 4, 5, 3, '2025-01-23'),   -- mouse
(2, 1, 2, 2, '2025-01-24'),   -- headphones
(3, 3, 6, 1, '2025-01-25'),   -- monitor
(4, 4, 4, 2, '2025-01-26'),   -- keyboard
(5, 2, 1, 1, '2025-01-27'),   -- laptop
(6, 1, 3, 3, '2025-01-28'),   -- chair
(1, 3, 6, 1, '2025-01-29'),   -- monitor
(2, 4, 5, 2, '2025-01-30');   -- mouse

SELECT * FROM customers;
SELECT * FROM orders;
SELECT *FROM products;
SELECT * FROM salespersons;

-- SELECT + DISTINCT
SELECT DISTINCT City 
from customers; 

SELECT DISTINCT Category As Product_Category
from products; 

-- SELECT + ALIAS (AS) 
SELECT CustomerName AS Customer_Name,
		Email AS Email_ID
FROM customers;

SELECT ProductName, 
		Price,
        (Price * 2) AS DoublePrice
from products;

SELECT ProductName,
	   Price,
       (Price * 0.10) AS TaxPrice
FROM products;

-- WHERE CLAUSE WITH OPERATORS

SELECT *
FROM customers 
WHERE City = "Hyderabad"; 

SELECT *
FROM products 
WHERE Price > 10000 ; 

SELECT *
FROM orders 
WHERE OrderDate > 2025-01-12 ; 

SELECT *
FROM products 
WHERE Price <>  1500 ; 

SELECT ProductID, ProductName, price
FROM Products
WHERE price <> 1500;

SELECT *
FROM customers 
WHERE Email IS NULL ; 

SELECT *
FROM orders 
WHERE Quantity IS NOT NULL ; 

SELECT *
FROM customers 
WHERE Gender = "Female" AND City = "Chennai"; 

SELECT CustomerID, CustomerName, city
FROM customers 
WHERE City IN ('Chennai', 'Bangalore', 'Hyderabad'); 

SELECT ProductID, ProductName, Category
FROM products 
WHERE Category NOT IN ('Electronics', 'Furniture'); 

-- ORDER BY & LIMIT 
SELECT CustomerID, CustomerName
FROM customers
ORDER BY CustomerName; 

SELECT ProductID, 
	   ProductName,
       Price
FROM products
ORDER BY PRICE DESC
LIMIT 3

SELECT ProductID, 
	   ProductName,
       Price
FROM products
WHERE Price > 5000 
ORDER BY Price DESC
LIMIT 3

SELECT City, 
		Count(*) AS City_Wise_Customer_Count
FROM customers
GROUP BY city
ORDER BY City_Wise_Customer_Count DESC;

SELECT CustomerID, CustomerName, City
FROM customers
WHERE City IN ('Chennai', 'Pune', 'Hyderabad')
ORDER BY CustomerName;

SELECT 
	CONCAT(city, ' - ', CustomerName) AS City_Customer
FROM customers
ORDER BY city ASC, CustomerName ASC;

SELECT CustomerID, CustomerName
FROM customers
WHERE CustomerName LIKE ('A%')
ORDER BY CustomerName ASC;

-- . Find the total number of customers in the Customers table.

SELECT Count(*) As total_customer
from customers;

-- GROUP BY AND HAVING

SELECT City,
	COUNT(*) AS Total_Customer
    from customers
    group by city 
    
select
	Gender, 
	COUNT(*) AS Total_Customer
from customers
group by Gender;
    
SELECT 
    gender,
    COUNT(*) AS total_customers
FROM Customers
GROUP BY gender;

SELECT City, CustomerName
FROM customers
group by city;

SELECT city, CustomerName
FROM Customers
GROUP BY city,  CustomerName;

SELECT City,
COUNT(*) AS total_customers
from customers
group by city 
HAVING total_customers > 2

-- Total orders per customer, but show only customers with more than 3 orders.


SELECT 
    CustomerID,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 3;

-- Product ID and total quantity sold, but only products where total quantity is between 5 and 

select 
	OrderID,
    sum(Quantity) As Total_Quantity
from orders
Group by OrderID
having  sum(Quantity) BETWEEN 1 AND 5
	
SELECT 
    category,
    AVG(price) AS average_price
FROM Products
GROUP BY category
HAVING AVG(price) > 5000;
