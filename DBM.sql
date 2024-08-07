CREATE DATABASE EmployeeDB
GO

USE EmployeeDB
GO

CREATE TABLE Department(
    DepartID INT PRIMARY KEY,
    DepartName VARCHAR(50) NOT NULL,
    Description VARCHAR(100) NOT NULL
);

CREATE TABLE Employee(
    EmpCode CHAR(6) PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Birthday SMALLDATETIME NOT NULL,
    Gender BIT DEFAULT 1,
    Address VARCHAR(1000),
    DepartID INT,
    FOREIGN KEY (DepartID) REFERENCES Department(DepartID),
    Salary MONEY
)
GO

INSERT INTO Department
VALUES (123, 'PR', 'Public Relations Department'),
       (234, 'IT', 'Information Technology Department'),
       (345, 'HR', 'Human Resources Department')
GO

INSERT INTO Employee (EmpCode, FirstName, LastName, Birthday, Address, DepartID, Salary)
VALUES ('PR01', 'Jisoo', 'Kim', '1995/01/03', 'Busan', 123, 6000000000000),
       ('IT02', 'See', 'Ong', '1995/08/09', 'Berlin', 234, 8880000000000),
       ('HR03', 'Bee', 'Song', '1998/12/12', 'London', 345, 7000000000)
GO

UPDATE Employee SET Salary = Salary * 1.1;

ALTER TABLE Employee
ADD CONSTRAINT Salary CHECK (Salary > 0);