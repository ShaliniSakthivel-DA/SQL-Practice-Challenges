-- =====================================================
-- BASIC CTE PRACTICE QUESTIONS & SOLUTIONS
-- =====================================================

USE sales_analytics; 

-- 1.	Create a CTE to calculate the total order quantity for each customer and display customers with quantity greater than 3.

 WITH CustomerQuantity AS 
	(
	SELECT CustomerID,
	SUM(Quantity) AS total_quantity
    FROM orders
    GROUP BY CustomerID )
SELECT * FROM CustomerQuantity
WHERE total_quantity > 3;
    
-- 2.	Create a CTE to calculate total sales amount for each order (Price × Quantity) and display all orders.

WITH OrderSales AS (
    SELECT o.OrderID,
           p.Price,
           o.Quantity,
           (p.Price * o.Quantity) AS total_sales
    FROM Orders o
    JOIN Products p
    ON o.ProductID = p.ProductID
)
SELECT * FROM OrderSales;

-- 3.	Create a CTE to calculate the total sales amount for each salesperson.

WITH SalespersonSales AS (
	SELECT o.SalespersonID,
	SUM(p.Price * o.Quantity) AS Total_Sales
	FROM orders o
    JOIN products p 
    ON o.ProductID = p.ProductID
	GROUP BY o.SalespersonID
	)
SELECT * FROM SalespersonSales;

-- 4.	Create a CTE to calculate the average product price by category.

WITH CategoryAverage AS (
	SELECT Category,
    ROUND(AVG(Price),2) AS avg_price
    FROM products
	GROUP BY Category )
SELECT * FROM CategoryAverage; 

-- 5.	Create a CTE to display customers and their total number of orders.

WITH CustomerOrders AS (
	SELECT CustomerID,
	COUNT(OrderID) AS total_orders
FROM orders
GROUP BY CustomerID )
SELECT * FROM CustomerOrders; 

-- 6.	Create a CTE to find the top 3 most sold products based on quantity.

WITH ProductSales AS (
	SELECT ProductID,
    SUM(quantity) AS total_quantity
    FROM orders 
	GROUP BY ProductID
)
SELECT * FROM ProductSales; 

-- 7.	Create a CTE to calculate total revenue for each product.

WITH ProductRevenue AS (
	SELECT  o.ProductID,
	SUM(p.price * o.quantity) AS total_revenue
    FROM orders o
    JOIN products p ON
    o.ProductID = p.ProductID
	GROUP BY ProductID
)
SELECT *
FROM ProductRevenue;

-- 8.	Create a CTE to display salesperson performance (total sales vs target amount).

WITH SalesPerformance AS (
    SELECT o.SalespersonID,
           SUM(p.price * o.quantity) AS total_sales,
           s.TargetAmount
    FROM orders o
    JOIN salespersons s
        ON o.SalespersonID = s.SalespersonID
    JOIN products p
        ON o.ProductID = p.ProductID
    GROUP BY o.SalespersonID, s.TargetAmount
)
SELECT *,
       (total_sales - TargetAmount) AS performance_difference
FROM SalesPerformance;

-- 9.	Create a CTE to find cities that have more than 2 customers.

WITH CityCustomers AS (
	SELECT City,
	COUNT(CustomerID) AS total_customers
    FROM customers
    GROUP BY City )
SELECT * FROM CityCustomers
WHERE total_customers >2 ; 

-- 10.	Create a CTE to calculate total sales per day.

WITH DailySales AS (
	SELECT o.OrderDate,
     SUM(p.price * o.quantity) AS total_sales
    FROM orders o
    INNER JOIN products p ON
    o.ProductID =p. ProductID
    GROUP BY OrderDate )
SELECT * FROM DailySales; 

-- 11.	Create a CTE to find customers whose total purchase amount is greater than the average purchase amount of all customers.

WITH CustomerPurchase AS (
    SELECT o.CustomerID,
           SUM(p.price * o.quantity) AS total_purchase
    FROM orders o
    INNER JOIN products p ON 
    o.ProductID = p.ProductID
    GROUP BY o.CustomerID 
),
AveragePurchase AS (
    SELECT AVG(total_purchase) AS avg_purchase
    FROM CustomerPurchase
)
SELECT cp.*
FROM CustomerPurchase cp
JOIN AveragePurchase ap
ON cp.total_purchase > ap.avg_purchase;

-- 12.	Create a CTE to calculate category-wise total sales amount.

WITH CategorySales AS (
    SELECT p.Category,
           SUM(p.price * o.quantity) AS total_sales
    FROM orders o
    JOIN products p
    ON o.ProductID = p.ProductID
    GROUP BY p.category
)
SELECT *
FROM CategorySales;

-- 13.	Create a CTE to find products whose price is higher than the average price of their category.

WITH CategoryAvg AS (
    SELECT category,
           AVG(price) AS avg_price
    FROM products
    GROUP BY category
)
SELECT p.*
FROM products p
JOIN CategoryAvg ca
ON p.category = ca.category
WHERE p.price > ca.avg_price;

-- 14.	Create a CTE to display salesperson ranking based on total sales amount.

WITH SalesRanking AS (
    SELECT o.SalespersonID,
           SUM(p.price * o.quantity) AS total_sales
    FROM orders o
    INNER JOIN products p ON
    o.ProductID = p.ProductID
    GROUP BY SalespersonID
)
SELECT *,
       RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM SalesRanking;

-- 15.	Create a CTE to find customers who purchased more than one different product.

WITH CustomerProducts AS (
    SELECT CustomerID,
           COUNT(DISTINCT ProductID) AS product_count
    FROM orders
    GROUP BY CustomerID
)
SELECT *
FROM CustomerProducts
WHERE product_count > 1;