-- ============================================
-- Title: DDL Commands Practice
-- Description: This script demonstrates Data Definition Language (DDL) operations 
-- including CREATE, ALTER, RENAME, TRUNCATE, and DROP. 
-- It focuses on managing database structure using a Hospital scenario.
-- ============================================

-- DDL Commands Practice

-- Creating Database 

CREATE DATABASE HospitalDB;
USE HospitalDB; 

-- CREATE TABLE
CREATE TABLE Patients (
    PatientID INT,
    PatientName VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    AdmissionDate DATE
);

-- ALTER - ADD COLUMN
ALTER TABLE Patients
ADD DoctorAssigned VARCHAR(50);

-- ALTER - MODIFY COLUMN
ALTER TABLE Patients
MODIFY PatientName VARCHAR(100);

-- RENAME TABLE
RENAME TABLE Patients TO Patient_Info;

-- TRUNCATE TABLE
TRUNCATE TABLE Patient_Info;

-- DROP TABLE
DROP TABLE Patient_Info;
