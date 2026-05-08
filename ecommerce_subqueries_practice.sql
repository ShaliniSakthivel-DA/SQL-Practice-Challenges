-- ----------------------------------------------------------
-- SQL SUBQUERIES PRACTICE PROJECT
-- ----------------------------------------------------------
-- SINGLE ROW SUBQUERIES
-- ----------------------------------------------------------

USE sales_analytics;

SELECT * FROM customers ;

-- 1.	Find customers who live in the same city as 'Arjun Kumar'.
SELECT *
FROM customers
WHERE City = ( SELECT City
				FROM customers
                WHERE  CustomerName = 'Arjun Kumar'
);

-- 2.	Find products that are more expensive than the average product price.

SELECT *
	FROM products
    WHERE Price > ( SELECT AVG(Price)
					FROM products) ; 
		
-- 3.	Find products belonging to the same category as 'Laptop'.

SELECT * 
	FROM products
    WHERE ProductName = (SELECT ProductName
						FROM products 
                        WHERE ProductName = 'Laptop'); 
                        
-- 4.	Find customers who have placed more orders than the customer with CustomerID = 5.

SELECT CustomerID
FROM orders
GROUP BY CustomerID
HAVING COUNT(*) > (
    SELECT COUNT(*)
    FROM orders
    WHERE CustomerID = 5
);

-- 5.	Find products that are priced higher than the product with ProductID = 3.

SELECT *
FROM products
WHERE Price > (SELECT Price
				FROM products
                WHERE  ProductID = 3 ); 

-- 6.	Find customers who placed an order on the same date as OrderID = 1.

SELECT CustomerID
FROM orders
WHERE OrderDate = ( SELECT OrderDate
					FROM orders
                    WHERE OrderID = 1 ) ; 
                    
-- 7.	Find the salesperson whose target amount is higher than the average target.

SELECT *
FROM salespersons
WHERE TargetAmount > (SELECT AVG(TargetAmount)
						FROM salespersons); 
                        
-- MULTI ROW SUBQUERIES
-- 8.	Find customers who have ordered any product in the 'Electronics' category.
                    
SELECT DISTINCT CustomerID
FROM orders
WHERE ProductID IN (
    SELECT ProductID
    FROM products
    WHERE category = 'Electronics'
);

-- 9.	Find products that were ordered by customers from Chennai.

SELECT DISTINCT ProductID
FROM orders
WHERE CustomerID IN  (SELECT CustomerID
				FROM customers
                WHERE City =  'Chennai'); 
                
-- 10.	Find salespersons who handled orders for customers from Bangalore.

SELECT 
	DISTINCT SalespersonID
FROM orders
WHERE CustomerID IN (SELECT CustomerID
					FROM customers
                    WHERE City = 'Bangalore'); 
                    
-- 11.	Find products whose price is greater than ALL products in the Furniture category.

SELECT *  
FROM products
WHERE Price  > ALL (SELECT Price
					FROM products
                    WHERE Category = 'Furniture'); 
	
-- 12.	Find products whose price is greater than ANY Electronics product.

SELECT * 
FROM products
WHERE Price > ANY ( SELECT Price
					FROM products
                    WHERE Category = 'Electronics'); 
                    
-- 13.	Find customers who purchased products costing more than 10000.

SELECT DISTINCT CustomerID
FROM orders
WHERE ProductID IN (SELECT ProductID
					FROM products
                    WHERE Price > 10000); 
                    
-- CORRELATED SUBQUERIES
-- 14.	Find customers who have placed at least one order.
                    
SELECT *
FROM customers c
WHERE EXISTS (
			SELECT 1
			FROM orders o
			WHERE o.CustomerID = c.CustomerID
);
	
-- 15.	Find customers who have placed more than 2 orders.

SELECT c.CustomerID
FROM customers c
WHERE (
		SELECT COUNT(*)
		FROM orders o
		WHERE o.CustomerID = c.CustomerID
) > 2;

-- 16.	Find products that have been ordered more than once.

SELECT p.ProductID
FROM products p
WHERE ( 
    SELECT COUNT(*)
    FROM orders o
    WHERE o.ProductID = p.ProductID
) > 1;

-- 17.	Find salespersons who have handled more than 3 orders.

SELECT *
FROM salespersons s
WHERE ( SELECT COUNT(*)
    FROM orders o
    WHERE o.SalespersonID = s.SalespersonID
) > 3;

-- 18.	Find customers who have purchased products more expensive than the average product price in that category.

SELECT o.CustomerID
FROM orders o
WHERE o.ProductID IN (
    SELECT p.ProductID
    FROM products p
    WHERE p.price > (
        SELECT AVG(price)
        FROM products p2
        WHERE p2.category = p.category
    )
); 

-- 19.	Find products whose price is greater than the average price of their category.

SELECT ProductID
FROM products P
WHERE price > (
    SELECT AVG(price)
    FROM products p2
    WHERE p2.Category= p.Category
);

-- 20.	Find customers whose total orders are greater than the average number of orders placed by customers.

SELECT CustomerID
FROM orders
GROUP BY CustomerID
HAVING COUNT(*) > (
		SELECT AVG(order_count)
		FROM (
        SELECT COUNT(*) AS order_count
        FROM orders
        GROUP BY CustomerID
    ) AS temp
);