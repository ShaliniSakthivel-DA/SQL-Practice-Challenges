-- =====================================================
-- DAY 5: SQL CODING CHALLENGE – JOINS & BUILT-IN FUNCTIONS
-- =====================================================

-- 1CREATE DATABASE

CREATE DATABASE StudentsDB;
USE StudentsDB;

-- CREATE TABLES

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Duration VARCHAR(20)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- INSERT SAMPLE DATA

INSERT INTO Students VALUES
(1, 'Aarav', 21, 'Chennai'),
(2, 'Meera', 22, 'Bangalore'),
(3, 'Karthik', 23, 'Hyderabad'),
(4, 'Divya', 21, 'Delhi');

INSERT INTO Courses VALUES
(101, 'Data Analytics', '3 Months'),
(102, 'Python Programming', '2 Months'),
(103, 'SQL Basics', '1 Month');

INSERT INTO Enrollments VALUES
(1001, 1, 101, '2025-05-10'),
(1002, 2, 102, '2025-06-01'),
(1003, 3, 103, '2025-06-15');

-- =====================================================
-- Question 1 – INNER JOIN
-- Show students with their enrolled course names
-- =====================================================

SELECT s.StudentID,
		s.StudentName,
        c.CourseName
FROM students s
INNER JOIN enrollments e ON
 s.StudentID = e.StudentID
INNER JOIN courses c ON
e.CourseID = c.CourseID; 

-- =====================================================
-- Question 2 – LEFT JOIN and RIGHT JOIN
-- List all students and their courses
-- =====================================================
-- LEFT JOIN  

SELECT s.StudentName,
        e.CourseID
FROM students s
LEFT JOIN enrollments e ON
 s.StudentID = e.StudentID;

-- RIGHT JOIN

SELECT s.StudentName,
        e.CourseID
FROM students s
RIGHT JOIN enrollments e ON
 s.StudentID = e.StudentID;
 
-- =====================================================
-- Question 3 – ROUND()
-- While preparing numeric reports, analysts need to round off decimal values.
-- =====================================================

SELECT ROUND(123.4567,2) AS Avg_Duration;

-- =====================================================
-- Question 4 – ABS() & MOD()
-- The HR team wants to calculate absolute values and remainders for data validation.
-- =====================================================

SELECT ABS(-250) AS Absolute_Value,
       MOD(25, 4) AS Remainder_Value;

-- =====================================================
-- Question 5 – CONCAT()
-- The placement cell wants a full description combining each student’s name and city.
-- =====================================================

SELECT StudentName,
       CONCAT(StudentName, ' from ', City) AS Full_Description
FROM Students;

-- =====================================================
-- Question 6 – LENGTH()
-- The admin wants to find names with length greater than a certain value for formatting.
-- =====================================================

SELECT StudentName,
       LENGTH(StudentName) AS Name_Length
FROM Students;

-- ===================================================== 
-- Question 7 – REPLACE()
-- Course titles need updating — every occurrence of “SQL” should be replaced with “Database.”
-- =====================================================

SELECT CourseName,
       REPLACE(CourseName, 'SQL', 'Database') AS Updated_CourseName
FROM Courses;

-- ===================================================== 
-- Question 8 – SUBSTRING()
-- For generating student codes, you need the first 3 letters of each name.
-- ===================================================== 

SELECT StudentName,
       SUBSTRING(StudentName, 1, 3) AS Code_Prefix
FROM Students;

-- ===================================================== 
-- Question 9 – UPPER() & LOWER()
-- Standardize name formatting for email IDs and certificates.
-- ===================================================== 

SELECT StudentName,
       UPPER(StudentName) AS UPPER_Name,
       LOWER(StudentName) AS LOWER_Name
FROM Students;

-- ===================================================== 
-- Question 10 – DATE FUNCTIONS (NOW, DATEDIFF, DATE_ADD)
-- The enrollment team needs to calculate report time, duration, and follow-up dates.
-- ===================================================== 

SELECT s.StudentName,
       e.EnrollmentDate,
       DATE_ADD(e.EnrollmentDate, INTERVAL 10 DAY) AS FollowUp_Date,
       DATEDIFF('2025-06-01', '2025-05-10') AS Days_Difference,
       NOW() AS Current_DateTime
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID;
