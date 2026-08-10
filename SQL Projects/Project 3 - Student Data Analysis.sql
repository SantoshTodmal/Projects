 -- Objective:
-- Students will design a simple relational database using MySQL, create three related tables, insert sample data, and answer queries based on the data.
CREATE DATABASE UniversityDB ;
USE UniversityDB;

CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50)
);

CREATE TABLE Students (
StudentID INT PRIMARY KEY, 
Name VARCHAR(50) ,
Age TINYINT ,
DepartmentID INT ,
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Courses (
CourseID INT ,
CourseName VARCHAR (50) ,
StudentID INT ,
FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Departments
(DepartmentID,DepartmentName)
VALUES 
(101,"Mechanical Engineering"),
(102,"Civil Engineering"),
(103,"Electrical Engineering"),
(104,"E&TC Engineering"),
(105,"Computer Engineering")
;

INSERT INTO Students 
(StudentID,Name,Age,DepartmentID)
VALUES
(1001,'Sandesh Shejwal',22,101),
(1002,'Akash Karpe',21,102),
(1003,'Prasad Satre',23,102),
(1004,'Abhishek Phalke',22,103),
(1005,'Shubham Kakade',21,104),
(1006,'Samir Mohite',23,105),
(1007,'Pravin Hadke',22,103),
(1008,'Sachin Vidhate',24,102),
(1009,'Satish Yeole',22,101),
(1010,'Atul Ghodke',21,101),
(1011,'Sandip Harde',22,103),
(1012,'Rahul Jadhav',23,101),
(1013,'Akash Satre',24,104),
(1014,'Sujay Vikhe',24,105),
(1015,'Sandip Chavan',22,103)
;

INSERT INTO Courses 
(CourseID,CourseName,StudentID)
VALUES
(201,'Machine Design',1001),
(201,'Machine Design',1009),
(201,'Machine Design',1010),
(201,'Machine Design',1012),
(202,'AutoCAD',1001),
(202,'AutoCAD',1012),
(202,'AutoCAD',1002),
(202,'AutoCAD',1003),
(202,'AutoCAD',1008),
(203,'Power System',1004),
(203,'Power System',1015),
(204,'Communication System',1005),
(204,'Communication System',1013),
(205,'Data Science',1014),
(205,'Data Science',1001),
(205,'Data Science',1003),
(205,'Data Science',1008),
(205,'Data Science',1005)
;

SELECT * FROM Departments;
SELECT * FROM Students;
SELECT * FROM COURSES;

-- 5. Query-Based Questions
-- a. Retrieve all student details along with their department names.
SELECT s.StudentID,s.Name,s.Age,s.DepartmentID,d.DepartmentName
FROM students AS s , Departments AS d 
WHERE s.DepartmentID = d.DepartmentID
ORDER BY s.StudentID;

SELECT s.*,d.DepartmentName
FROM students AS s , Departments AS d 
WHERE s.DepartmentID = d.DepartmentID
ORDER BY s.StudentID;

-- b. Find the names of all students who are enrolled in 'Mechanical Engineering'.
SELECT d.DepartmentName,s.Name
FROM Departments AS d
JOIN Students AS s
ON d.DepartmentID = s.DepartmentID
WHERE DepartmentName = 'Mechanical Engineering';

-- c. Count how many students are in each department.
SELECT d.DepartmentName,count(*) AS student_count
FROM Departments AS d
JOIN Students AS s
ON d.DepartmentID = s.DepartmentID
GROUP BY DepartmentName;

-- d. List the courses taken by 'Sandesh Shejwal'. (assuming Sandesh Shejwal is a student)
SELECT s.Name,c.CourseName
FROM Students AS s
JOIN Courses AS c
ON s.StudentID = c.StudentID
WHERE Name = 'Sandesh Shejwal';

-- e. Find students who are enrolled in more than one course.
SELECT s.StudentID,s.Name,count(*) AS course_count
FROM Students AS s
JOIN Courses AS c
ON s.StudentID = c.StudentID
GROUP BY s.StudentID
HAVING count(*) > 1;

-- f. Get the average age of students in each department.
SELECT d.DepartmentName,AVG(age) AS Average_Age
FROM Departments AS d
JOIN Students AS s
ON d.DepartmentID = s.DepartmentID
GROUP BY DepartmentName;

-- g. Find the department with the most students.
SELECT d.DepartmentID,d.DepartmentName,count(*) AS student_counts
FROM Departments AS d
JOIN Students AS s
ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentID,d.DepartmentName
ORDER BY student_counts DESC
LIMIT 1;

-- h. List all students who are NOT enrolled in any course.
SELECT s.Name
FROM Students AS s
LEFT JOIN Courses AS c
ON s.StudentID = c.StudentID
WHERE c.StudentID IS NULL;

-- i. Retrieve students along with the total number of courses they are enrolled in.
SELECT s.StudentID,s.Name,count(*) AS course_count
FROM Students AS s
JOIN Courses AS c
ON s.StudentID = c.StudentID
GROUP BY s.StudentID;

-- j. Find students who belong to 'Civil Engineering' and are taking a course with 'Data' in its name.
SELECT s.StudentID,s.Name,d.DepartmentName,c.CourseName
FROM Departments AS d
JOIN Students AS s
ON d.DepartmentID = s.DepartmentID
JOIN Courses AS c
ON s.StudentID = c.StudentID
WHERE d.DepartmentName = 'Civil Engineering' AND c.CourseName like '%Data%';