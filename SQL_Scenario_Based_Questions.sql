-- =====================================================
-- SQL SCENARIO-BASED PRACTICE QUESTIONS & SOLUTIONS
-- =====================================================

USE SQL_COMPANY_DB;

-- 1.	Find duplicate customer records from the Customers table. 

SELECT customer_name,
	COUNT(*) AS duplicate_count
FROM Customers
GROUP BY customer_name
HAVING COUNT(*) > 1;

-- 2.	Replace NULL salaries with 0 in the Employees table. 

SELECT emp_id,
		emp_name,
        IFNULL(salary,0) AS Salary
FROM employees; 

-- 3.	Fetch the top 5 highest-paid employees. 

SELECT emp_id,
		emp_name,
        salary
FROM employees
ORDER BY salary DESC
LIMIT 5 

-- 4.	Display employees whose names start with letter A. 

SELECT *
FROM employees
WHERE emp_name LIKE 'A%';

-- 5.	Show all orders placed between two given dates. 

SELECT *
FROM orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-06-30';

-- 6.	Show employee names along with department names. 

SELECT e.emp_name,
		d.dept_name
FROM employees e
INNER JOIN departments d ON
e.dept_id = d.dept_id

-- 7.	Find employees who are not assigned to any department. 

SELECT *
FROM employees
WHERE dept_id IS NULL;

-- 8.	Show all departments even if no employees are assigned. 

SELECT d.dept_name,
		e.emp_name
FROM departments d
INNER JOIN employees e ON
d.dept_id = e.dept_id

-- 9.	Find records present in one table but missing in another table. 

SELECT c.customer_id,
       c.customer_name
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- 10.	Show customers who placed orders and customers who did not place orders. 

SELECT c.customer_name,
       o.order_id
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id;

-- 11.	Calculate total sales month-wise from the Sales table. 

SELECT MONTH(order_date) AS Month_Number,
       SUM(amount) AS Total_Sales
FROM Sales
GROUP BY MONTH(order_date); 

-- 12.	Find average salary department-wise. 

SELECT dept_id,
		ROUND(AVG(salary)) AS Average_Salary
FROM employees
GROUP BY dept_id; 

-- 13.	Find which department has the maximum number of employees. 

SELECT dept_id,
       COUNT(*) AS Total_Employees
FROM employees
GROUP BY dept_id
ORDER BY Total_Employees DESC
LIMIT 1;

-- 14.	Find the second highest salary in the Employees table. 

SELECT MAX(Salary) AS Second_Highest_Salary
FROM employees
WHERE Salary < (
    SELECT MAX(Salary)
    FROM employees
);

-- 15.	Find duplicate emails in the Customers table. 

SELECT email,
       COUNT(*) AS Duplicate_Count
FROM Customers
GROUP BY Email
HAVING COUNT(*) > 1;

-- 16.	Compare this month sales with last month sales. 

SELECT MONTH(order_date) AS Month_Number,
       SUM(amount) AS Current_Month_Sales,
       LAG(SUM(amount))
       OVER(ORDER BY MONTH(order_date)) AS Previous_Month_Sales
FROM Sales
GROUP BY MONTH(order_date);

-- 17.	Find top 3 products by revenue. 

SELECT product_id,
		ROUND(SUM(amount)) AS Total_Revenue
FROM sales
GROUP BY product_id
ORDER BY Total_Revenue DESC
LIMIT 3;

-- 18.	Find which city has the highest number of customers. 

SELECT City,
       COUNT(customer_id) AS Total_Customers
FROM customers
GROUP BY city
ORDER BY Total_Customers DESC
LIMIT 1;

-- 19.	Find customers who purchased more than 5 times. 

SELECT customer_id,
		COUNT(order_id) AS Total_Orders
FROM Orders
GROUP BY customer_id
HAVING COUNT(order_id) > 5;

-- 20.	Find inactive customers who have not ordered in the last 6 months. 

SELECT c.customer_id,
       c.customer_name
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
WHERE o.order_date < DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
   OR o.order_date IS NULL;
   
-- =====================================================
-- Window Function Scenarios
-- =====================================================

-- 21.	Rank employees based on salary. 

SELECT emp_name,
		salary,
        RANK() OVER (ORDER BY salary DESC) AS Salary_Rank
FROM employees; 

-- 22.	Calculate running total of sales by date. 

SELECT order_date,
       amount,
       SUM(amount)
       OVER(ORDER BY order_date) AS Running_Total
FROM Sales;

-- 23.	Show previous month sales using LAG() function. 

SELECT MONTH(order_date) AS Month_Number,
       SUM(amount) AS Total_Sales,
       LAG(SUM(amount))
       OVER(ORDER BY MONTH(order_date)) AS Previous_Month_Sales
FROM Sales
GROUP BY MONTH(order_date);

-- 24.	Find top performer in each sales region. 

WITH RegionRank AS (
    SELECT st.emp_name,
           st.Region,
           s.amount,
           RANK() OVER(
               PARTITION BY st.Region
               ORDER BY s.amount DESC
           ) AS Region_Rank
    FROM salesteam st
    JOIN sales s
        ON st.emp_id = s.emp_id
)
SELECT *
FROM RegionRank
WHERE Region_Rank = 1;

-- 25.	Assign row numbers to duplicate customer records. 

SELECT customer_id,
       customer_name,
       ROW_NUMBER()
       OVER(PARTITION BY customer_name ORDER BY customer_id) AS Row_Num
FROM Customers;

-- 26.	Create an index to improve employee name search performance. 

CREATE INDEX idx_employee_name
ON employees(emp_name);

-- 27.	Improve query performance on large sales table using indexing. 

CREATE INDEX idx_sales_date
ON Sales(order_date);

-- 28.	Use CTE to fetch employees with salary greater than 50,000. 

WITH HighSalaryEmployees AS (
    SELECT *
    FROM employees
    WHERE salary > 50000
)
SELECT *
FROM HighSalaryEmployees;

-- 29.	Create an index on customer email for faster lookup. 

CREATE INDEX idx_customer_email
ON customers(Email);

-- 30.	Extract today’s sales report automatically. 

SELECT *
FROM Sales
WHERE DATE(order_date) = CURDATE();

-- 31.	Generate total sales report from the Sales table. 

SELECT SUM(amount) AS Total_Sales
FROM Sales;

-- 32.	Remove duplicate customer records keeping one record. 

SET SQL_SAFE_UPDATES = 0;

DELETE c1
FROM customers c1
JOIN customers c2
ON c1.email = c2.email
AND c1.customer_id > c2.customer_id;

SET SQL_SAFE_UPDATES = 1;

-- 33.	Join Customers, Orders, and Products tables. 

SELECT c.customer_name,
       o.order_id,
       p.product_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN products p
ON o.product_id = p.product_id;

-- 34.	Generate monthly sales report. 

SELECT MONTH(order_date) AS Month_Number,
       YEAR(order_date) AS Year_Number,
       SUM(amount) AS Monthly_Sales
FROM Sales
GROUP BY YEAR(order_date), MONTH(order_date);

-- 35.	Find highest-selling product based on number of orders.

SELECT product_id,
       COUNT(order_id) AS Total_Orders
FROM orders
GROUP BY product_id
ORDER BY Total_Orders DESC
LIMIT 1;