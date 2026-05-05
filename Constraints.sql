-- ============================================
-- Title: Online Bookstore SQL Practice
-- Description: Covers Constraints + DML operations
-- (PK, FK, UNIQUE, CHECK, INSERT, SELECT, UPDATE, DELETE, TRUNCATE)
-- ============================================

-- Create Database 
CREATE DATABASE ONLINE_BOOKSTORE_DB; 
USE ONLINE_BOOKSTORE_DB; 

-- Create Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(50) NOT NULL,
    ISBN VARCHAR(20),
    Price DECIMAL(8,2) CHECK (Price > 0)
);

-- Add UNIQUE constraint to ISBN
ALTER TABLE Books
ADD CONSTRAINT unique_isbn UNIQUE (ISBN);

-- Create Orders table with FOREIGN KEY
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    BookID INT,
    OrderDate DATE NOT NULL,
    Quantity INT CHECK (Quantity > 0),
    CONSTRAINT fk_book
        FOREIGN KEY (BookID)
        REFERENCES Books(BookID)
);

-- INSERT DATA (DML) 

INSERT INTO Books (BookID, Title, Author, ISBN, Price) VALUES
(1, 'SQL Basics', 'John Doe', 'ISBN001', 500.00),
(2, 'Advanced SQL', 'Jane Smith', 'ISBN002', 750.00),
(3, 'Data Analytics', 'Sam Lee', 'ISBN003', 650.00),
(4, 'Power BI Guide', 'Alex Ray', 'ISBN004', 900.00),
(5, 'Python for Data', 'Chris Kim', 'ISBN005', 800.00);

-- Insert sample orders

INSERT INTO Orders (OrderID, BookID, OrderDate, Quantity) VALUES
(101, 1, '2024-01-10', 2),
(102, 2, '2024-01-11', 1),
(103, 3, '2024-01-12', 3);

-- RETRIEVE DATA

SELECT * FROM Books;
SELECT * FROM Orders;

-- UPDATE DATA

UPDATE Books
SET Price = 850.00
WHERE BookID = 5;

-- DELETE vs TRUNCATE

-- DELETE specific rows

SET SQL_SAFE_UPDATES = 0; -- SQL_SAFE_UPDATES COMMAND 

DELETE FROM Orders
WHERE Quantity = 1;

SET SQL_SAFE_UPDATES = 1; -- SQL_SAFE_UPDATES COMMAND

-- Check remaining data
SELECT * FROM Orders;

-- TRUNCATE all rows
TRUNCATE TABLE Orders;

-- Final check
SELECT * FROM Orders;