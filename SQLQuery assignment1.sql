CREATE DATABASE august_batch;
USE august_batch;
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 17),
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID)
);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID)
);
--Insert Departments
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(1, 'Computer Science'),
(2, 'Mechanical'),
(3, 'Electrical'),
(4, 'Civil'),
(5, 'Electronics');
INSERT INTO Students (StudentID, Name, Age, DepartmentID)
VALUES
(101, 'Ram', 19, 1),
(102, 'Sita', 22, 5),
(103, 'Hari', 20, 2),
(104, 'Rima', 26, 3),
(105, 'Mina', 23, 1);
INSERT INTO Courses (CourseID, CourseName, DepartmentID)
VALUES
(201, 'DBMS', 1),
(202, 'AI', 1),
(203, 'Thermodynamics', 2),
(204, 'Circuits', 5),
(205, 'Structures', 4);
--1. Students whose age is greater than 20
SELECT *
FROM Students
WHERE Age > 20;
--2. Courses of the "Computer Science" department
SELECT *
FROM Courses
WHERE DepartmentID = (
    SELECT DepartmentID FROM Departments
    WHERE DepartmentName = 'Computer Science'
);
--3. Students belonging to "Electronics" department
SELECT *
FROM Students
WHERE DepartmentID = (
    SELECT DepartmentID FROM Departments
    WHERE DepartmentName = 'Electronics'
);
--4. Students whose age is between 18 and 22
SELECT *
FROM Students
WHERE Age BETWEEN 18 AND 22;
--Q4: Joins
--1. INNER JOIN — Students with Departments
SELECT s.StudentID, s.Name, d.DepartmentName
FROM Students s
INNER JOIN Departments d
    ON s.DepartmentID = d.DepartmentID;
--2. LEFT JOIN — Courses with Departments
SELECT c.CourseID, c.CourseName, d.DepartmentName
FROM Courses c
LEFT JOIN Departments d
    ON c.DepartmentID = d.DepartmentID;
--RIGHT JOIN — Students with Courses
SELECT c.CourseID, c.CourseName, s.Name AS StudentName
FROM Students s
RIGHT JOIN Courses c
    ON s.DepartmentID = c.DepartmentID;
