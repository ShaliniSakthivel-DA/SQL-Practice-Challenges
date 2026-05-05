
-- Title: SQL Clauses and Operators Practice

-- Description: Demonstrates SQL querying using SELECT,
-- DISTINCT, WHERE clause, and various operators such as
-- comparison, logical, arithmetic, IN, BETWEEN, and LIKE
-- using an E-commerce database scenario.

-- 1️.Create Database
CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- 2️.Create Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0)
);

-- 3️.Create Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    sale_amount DECIMAL(10,2) CHECK (sale_amount > 0),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- 4️.Insert Sample Data into Product Table
INSERT INTO Product (product_id, product_name, price) VALUES
(1, 'Laptop', 85000.00),
(2, 'Smartphone', 45000.00),
(3, 'Headphones', 5000.00),
(4, 'Keyboard', 1200.00),
(5, 'Mouse', 800.00),
(6, 'Monitor', 15000.00),
(7, 'Webcam', 3500.00);

-- 5️.Insert Sample Data into Sales Table
INSERT INTO Sales (sale_id, product_id, quantity, sale_amount) VALUES
(1, 1, 2, 170000.00),
(2, 2, 3, 135000.00),
(3, 3, 5, 25000.00),
(4, 4, 10, 12000.00),
(5, 5, 15, 12000.00),
(6, 6, 2, 30000.00),
(7, 7, 4, 14000.00);

-- DISTINCT & AS
SELECT DISTINCT product_name FROM Product;
SELECT product_name AS Product_Name FROM Product;  
SELECT DISTINCT product_id FROM Product; 
SELECT price AS Product_Price FROM Product; 

-- WHERE
SELECT * FROM Product
WHERE Price > 10000; 

SELECT * FROM Product
WHERE Price < 5000; 

SELECT * FROM Sales
WHERE quantity = 2;

-- Comparison Operators
SELECT * FROM Product
WHERE Price >= 15000;

SELECT * FROM Sales
WHERE quantity <> 5 ;

-- Arithmetic Operators

SELECT product_name, Price, Price * 1.10 AS Increased_Price
FROM Product; 

SELECT sale_id, sale_amount, sale_amount + 500 AS sale_amount
FROM Sales;

-- Logical Operators

SELECT * FROM Product
WHERE Price > 5000 AND price < 50000;

SELECT * FROM Sales 
WHERE quantity = 2 OR quantity = 4;

SELECT * FROM Product
WHERE NOT price > 20000;

-- IS NULL / IS NOT NULL

SELECT * FROM Sales
WHERE product_id IS NULL;

SELECT * FROM Product
WHERE price IS NOT NULL;

SELECT * FROM Product
WHERE product_id IN (1, 3, 5) ;

SELECT * FROM Product
WHERE product_id NOT IN (2, 4, 6) ;

-- BETWEEN and NOT BETWEEN
SELECT * FROM Product
WHERE Price Between 1000 AND 20000; 

SELECT * FROM Product
WHERE Price NOT Between 5000 AND 50000;

-- LIKE and NOT LIKE

SELECT * FROM Product
WHERE product_name LIKE "M%"; 

SELECT * FROM Product
WHERE product_name LIKE "%e"; 

SELECT * FROM Product
WHERE product_name LIKE "%Phone%"; 

SELECT * FROM Product
WHERE product_name NOT LIKE "S%"; 

-- Mixed Questions (Exam Level)
-- price is between 1,000 and 20,000 AND product name starts with 'M'.

SELECT * FROM Product
WHERE Price  Between 1000 AND 20000 
AND product_name LIKE "M%"; 

-- sales where quantity is between 2 and 10.
SELECT * FROM Sales 
WHERE quantity BETWEEN  2 AND  10;

-- product_id is in (1,2,3) AND price greater than 5,000.
SELECT * FROM Product
WHERE product_id IN (1, 2, 3) 
AND Price > 5000; 

-- sale quantities from the Sales table
SELECT distinct quantity from  Sales;