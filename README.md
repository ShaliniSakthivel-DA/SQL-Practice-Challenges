# SQL-Practice-Challenges
Structured SQL practice for Data Analyst preparation – includes DDL, DML, Constraints, Joins, Subqueries, and real scenarios.

## 📂 DDL Commands

### 📄 File: DDL_Commands.sql

This section covers Data Definition Language (DDL) operations used to define and manage database structure.

### Topics Covered:
- CREATE TABLE
- ALTER TABLE (ADD, MODIFY)
- RENAME TABLE
- TRUNCATE TABLE
- DROP TABLE

### Scenario:
Hospital database – managing patient records and modifying table structure.

### Key Learning:
- Understanding how to create and modify tables
- Difference between TRUNCATE and DROP
- Managing schema changes effectively

## 📂 Constraints and DML Commands

### File: DML_Commands & Constraints.sql

### 📄 File: Online_Bookstore_SQL.sql

This section demonstrates SQL concepts related to data integrity and data manipulation using an online bookstore scenario.

### Topics Covered:

#### 🔹 Constraints
- PRIMARY KEY
- FOREIGN KEY
- UNIQUE
- CHECK

#### 🔹 DML Commands
- INSERT
- SELECT
- UPDATE
- DELETE
- TRUNCATE

### Scenario:
Online Bookstore – managing books and orders while ensuring data accuracy and consistency.

### Key Learning:
- Applying constraints to maintain data integrity
- Establishing relationships between tables using FOREIGN KEY
- Inserting and retrieving data efficiently
- Updating and deleting records with conditions
- Understanding the difference between DELETE and TRUNCATE

## 📂 Clauses and Operators

### 📄 File: Filtering_Operators.sql

This section focuses on SQL clauses and operators used for filtering and querying data.

### Topics Covered:
- SELECT, DISTINCT, AS
- WHERE clause
- Comparison Operators (=, >, <, >=, <>)
- Logical Operators (AND, OR, NOT)
- Arithmetic Operations
- IN and NOT IN
- BETWEEN and NOT BETWEEN
- LIKE and NOT LIKE
- IS NULL and IS NOT NULL

### Scenario:
E-commerce database – analyzing product and sales data.

### Key Learning:
- Filtering data using multiple conditions
- Applying different operators effectively
- Writing efficient SQL queries for data analysis

## 📂 SQL Clauses and Operators Practice  

### 📄 File: Sales_Analytics_SQL_Clauses_Operators.sql  

This section focuses on essential SQL clauses, filtering operators, sorting techniques, grouping functions, and aggregate operations used for data analysis.

### Topics Covered:
- SELECT, DISTINCT, AS
- WHERE clause
- Comparison Operators (=, >, <, >=, <>)
- Logical Operators (AND, OR, NOT)
- Arithmetic Operations
- IN and NOT IN
- IS NULL and IS NOT NULL
- ORDER BY and LIMIT
- GROUP BY and HAVING
- Aggregate Functions (COUNT, SUM, AVG)

### Scenario:
Sales Analytics database – analyzing customer, product, and order data using SQL queries.

### Key Learning:
- Filtering data using multiple conditions
- Sorting and limiting query results
- Grouping records for business insights
- Using aggregate functions for analysis
- Writing optimized SQL queries for Data Analytics

Sales Analytics SQL Practice – Joins, Aggregations & Date Analysis

This SQL project is built using the Sales_Analytics database and focuses on real-world business analysis using relational data. It includes JOIN operations, aggregate functions, and date/time analysis to extract meaningful insights from sales data.

## 📂 Sales Analytics – Joins, Aggregations & Date Functions

### 📄 File: Sales_Analytics_Joins_Aggregations_DateAnalysis.sql

This section focuses on SQL joins, aggregate functions, and date/time functions used for real-world business analysis using the Sales_Analytics database.

### Topics Covered:

#### JOIN Operations
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- Multi-table joins (Customers, Orders, Products, Salespersons)

#### Built-in Functions + Aggregation
- SUM, COUNT, MIN, MAX
- Total sales calculation (Price × Quantity)
- Top customers by purchase amount
- Most sold product analysis

#### Date & Time Functions
- MONTH() and YEAR() filtering
- WEEK-wise order analysis
- DAYNAME() for weekday extraction
- Custom weekday sorting using FIELD()

### Scenario:
Sales Analytics database – analyzing customer purchases, product performance, salesperson contribution, and time-based sales trends.

### Key Learning:

- Writing multi-table JOIN queries
- Performing business sales aggregation
- Extracting insights using date functions
- Handling real-world analytical SQL problems
- Creating structured reporting queries for dashboards

## 📂 SQL Subqueries
### 📄 File: ecommerce_subqueries_practice.sql

This section covers SQL Subqueries used to perform advanced data analysis using nested queries on an E-Commerce database.

### Topics Covered:
- Single Row Subqueries (returns one value)
- Multi Row Subqueries (IN, ANY, ALL operators)
- Correlated Subqueries (inner query depends on outer query)
- Subqueries with Aggregate Functions (AVG, COUNT)
- Filtering data using nested SELECT statements

### Scenario:

E-Commerce database containing Customers, Products, Orders, Salespersons, and Categories tables used to analyze customer behavior, product pricing, and sales performance.

### Key Learning:
- Writing nested queries for complex conditions
- Understanding difference between Single Row and Multi Row subqueries
- Using IN, ANY, ALL operators effectively
- Applying correlated subqueries for row-by-row comparison
- Building logic for real-world business scenarios

  # 📂 SQL CTE Practice Questions & Solutions

### 📄 File: CTE_Practice_Solutions.sql

This section covers SQL Common Table Expressions (CTEs) used for data analysis and business reporting scenarios.

### Topics Covered:
- WITH Clause (CTE)
- Aggregate Functions
- GROUP BY
- INNER JOIN
- Revenue Calculations
- Ranking Functions
- Window Functions
- Customer & Sales Analysis

### Scenario:
Sales and product database – analyzing customer purchases, product revenue, salesperson performance, category analysis, and daily sales trends.

### Key Learning:
- Understanding how to write and use CTEs
- Performing aggregation using SUM(), AVG(), and COUNT()
- Using JOIN operations with CTEs
- Creating ranking reports using RANK()
- Solving business-oriented SQL problems
- Improving SQL query structuring and readability

## 📂 Window Functions

### 📄 File: Window_Functions_Practice.sql

This section covers SQL Window Functions used for analytical calculations and business reporting.

### Topics Covered:
- OVER()
- PARTITION BY
- RANK()
- DENSE_RANK()
- LAG()
- LEAD()
- Running Total
- Aggregate Window Functions

### Scenario:
Sales and product database – analyzing customer orders, salesperson performance, product rankings, sales trends, and category-wise analysis.

### Key Learning:
- Understanding how Window Functions work
- Using PARTITION BY for grouped analysis
- Creating rankings using RANK() and DENSE_RANK()
- Comparing previous and next records using LAG() and LEAD()
- Calculating running totals and analytical metrics
- Improving SQL analytical query skills

## 📂 SQL Joins & Built-in Functions

### 📄 File: Joins-and-Builtin-Functions-Practice.sql

This section covers SQL JOIN operations and commonly used built-in functions for analytical reporting and database querying.

### Topics Covered:
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- ROUND()
- ABS()
- MOD()
- CONCAT()
- LENGTH()
- REPLACE()
- SUBSTRING()
- UPPER()
- LOWER()
- NOW()
- DATEDIFF()
- DATE_ADD()

### Scenario:
School database – managing student enrollments, course information, text formatting, numeric calculations, and date-based reporting using SQL queries.

### Key Learning:
- Understanding JOIN operations between tables
- Retrieving related data using INNER JOIN, LEFT JOIN, and RIGHT JOIN
- Using numeric functions for calculations and validation
- Applying string functions for formatting and text manipulation
- Working with date functions for reporting and scheduling
- Improving SQL querying and analytical problem-solving skills

## 📂 SQL Scenario-Based Practice Questions

### 📄 File: SQL_Scenario_Based_Questions.sql

This section covers real-world SQL scenario questions used in data analysis, reporting, customer analysis, employee management, sales tracking, and database optimization.

### Topics Covered:
- Joins
- Aggregate Functions
- Subqueries
- Window Functions
- CTE (Common Table Expressions)
- Indexing
- Duplicate Record Handling
- Sales Analysis
- Customer Analysis
- Date Functions
- Ranking Functions
- Reporting Queries

### Scenario:
Business sales and employee database – managing customers, employees, departments, products, orders, and sales reports using SQL queries and analytical functions.

### Key Learning:
- Understanding real-time SQL business scenarios
- Writing complex JOIN and aggregation queries
- Using Window Functions like RANK() and LAG()
- Handling duplicate records efficiently
- Creating indexes for performance optimization
- Building sales and reporting queries
- Improving SQL analytical and problem-solving skills
